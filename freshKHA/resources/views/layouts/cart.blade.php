@extends('index')

@section('title')
    Cart
@endsection

@section('content')
    <!-- breadcrumb-section -->
	<div class="breadcrumb-section breadcrumb-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="breadcrumb-text">
						<p>Fresh and Organic</p>
						<h1>Cart</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->

	<!-- cart -->
	<div class="cart-section mt-150 mb-150">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<div class="cart-table-wrap">
						<table class="cart-table">
							<thead class="cart-table-head">
								<tr class="table-head-row">
									<th class="product-remove"></th>
									<th class="product-image">Product Image</th>
									<th class="product-name">Name</th>
									<th class="product-price">Price</th>
									<th class="product-quantity">Quantity</th>
									<th class="product-total">Total</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								@php
									$total = 0;
									$count = -1 ;
									$cart = session()->get('cart');                    
                            	@endphp
								@if(!empty(session()->get('cart')))
									@foreach ($cart as $item)
										@php
											$total += $item['price']*$item['quantity'];                           
											$count++;
										@endphp
										<tr class="table-body-row">
											<td class="product-remove"><a href="#"><i class="far fa-window-close"></i></a></td>
											<td class="product-image"><img src="{{asset('storage/'.$item['link_img'])}}" alt=""></td>
											<td class="product-name">{{$item['name']}}</td>
											<td class="product-price">${{$item['price']}}</td>
											<td class="product-quantity">
												<a class="btn btn-sm btn-incre" href="{{route('edit_cart', ['slug'=> 'minus' ,'id'=>$item['id']])}}"><i class="fas fa-minus-square"></i></a>
												<input value="{{$item['quantity']}}" readonly>
												<a class="btn btn-sm btn-incre" href="{{route('edit_cart', ['slug'=> 'plus', 'id'=>$item['id'] ])}}"><i class="fas fa-plus-square"></i></a>	
											</td>
											<td class="product-total">${{$total}}</td>
											<td><a href="{{route('remove_product_in_cart', ['id'=>$item['id']])}}"><fa class="fa fa-close"></fa></a></td>
										</tr>
									@endforeach
								@endif
								
							</tbody>
						</table>
					</div>
					<div class="cart-buttons ">						
						<a href="{{route('checkout')}}" class="boxed-btn black">Check Out</a>
					</div>
				</div>

				<!-- <div class="col-lg-4">
					<div class="total-section">
						<table class="total-table">
							<thead class="total-table-head">
								<tr class="table-total-row">
									<th>Total</th>
									<th>Price</th>
								</tr>
							</thead>
							<tbody>
								<tr class="total-data">
									<td><strong>Subtotal: </strong></td>
									<td>$500</td>
								</tr>
								<tr class="total-data">
									<td><strong>Shipping: </strong></td>
									<td>$45</td>
								</tr>
								<tr class="total-data">
									<td><strong>Total: </strong></td>
									<td>$545</td>
								</tr>
							</tbody>
						</table>
						<div class="cart-buttons">
							<a href="cart.html" class="boxed-btn">Update Cart</a>
							<a href="checkout.html" class="boxed-btn black">Check Out</a>
						</div>
					</div>

					<div class="coupon-section">
						<h3>Apply Coupon</h3>
						<div class="coupon-form-wrap">
							<form action="index.html">
								<p><input type="text" placeholder="Coupon"></p>
								<p><input type="submit" value="Apply"></p>
							</form>
						</div>
					</div>
				</div> -->
			</div>
		</div>
	</div>
	<!-- end cart -->

	
@endsection