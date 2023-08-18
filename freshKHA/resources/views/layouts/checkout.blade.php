@extends('index')

@section('title')
    Checkout
@endsection

@section('content')
    <!-- breadcrumb-section -->
	<div class="breadcrumb-section breadcrumb-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="breadcrumb-text">
						<p>Fresh and Organic</p>
						<h1>Check Out Product</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->

	<!-- check out section -->
	<div class="checkout-section mt-150 mb-150">
		<div class="container">
			<form action="" method="POST">
				<div class="row">
					<div class="col-lg-8">
						<div class="checkout-accordion-wrap">
							<div class="accordion" id="accordionExample">
								<div class="card single-accordion">
									<div class="card-header" id="headingTwo">
									  <h5 class="mb-0">
										<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
										  Billing
										</button>
									  </h5>
									</div>
									<div id="collapseTwo" class="collapse " aria-labelledby="collapseTwo" data-parent="#accordionExample">
								 
										<table class="cart-table" style="margin-bottom: 10px">
											<thead class="cart-table-head">
												<tr class="table-head-row">										
													<th class="product-image">Product Image</th>
													<th class="product-name">Name</th>
													<th class="product-price">Price</th>
													<th class="product-quantity">Quantity</th>
													<th class="product-total">Total</th>
												</tr>
											</thead>
											<tbody>
												@php
													$total = 0;
													$count = -1 ;
													$cart = session()->get('cart');                    
												@endphp
												@foreach ($cart as $item)
													@php
														$total += $item['price']*$item['quantity'];                           
														$count++;
													@endphp
													<tr style="text-align: center;" class="table-body-row">
														<td class="product-image"><img src="{{asset('storage/'.$item['link_img'])}}" alt=""></td>
														<td class="product-name">{{$item['name']}}</td>
														<td class="product-price">${{$item['price']}}</td>
														<td class="product-quantity"><input  value="{{$item['quantity']}}"></td>
														<td class="product-total">${{$total}}</td>
														
													</tr>
												
												@endforeach
												
											</tbody>
											<br>
										</table>	
									</div>
									
								  </div>
							  <div class="card single-accordion">
								<div class="card-header" id="headingOne">
								  <h5 class="mb-0">
									<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									  Your Address
									</button>
								  </h5>
								</div>
								<div id="collapseOne" class="collapse show" aria-labelledby="collapseOne" data-parent="#accordionExample">
									<div class="card-body">
									  
											  <input style="width=100%" type="text" placeholder="Name" required value="{{Auth::user()->name}}" name="name"> 
											  @if ($errors->has('name'))
												  <span style="color: red"> {{$errors->first('name')}}</span> 
											  @endif
											  <br><br>
											  
											  <input style="width=100%" type="email" placeholder="Email" readonly required value="{{Auth::user()->email}}" name="email"> 
											  @if ($errors->has('email'))
												  <span style="color: red"> {{$errors->first('email')}}</span> 
											  @endif
											  <br><br>
											  
											  <input style="width=100%" type="text" placeholder="Address" required value="{{Auth::user()->address != null ? Auth::user()->address : '' }}" name="address"> 
											  @if ($errors->has('address'))
												  <span style="color: red"> {{$errors->first('address')}}</span> 
											  @endif
											  <br><br>
											  
											  <input style="width=100%" type="text" placeholder="Phone" required value="{{Auth::user()->phone_number != null ? Auth::user()->phone_number : '' }}" name="phone_number"> 
											  @if ($errors->has('phone_number'))
												  <span style="color: red"> {{$errors->first('phone_number')}}</span> 
											  @endif
											  <br><br>
											  
											  <textarea style="width=100%" name="bill" id="bill" cols="30" rows="10" placeholder="Say Something"></textarea>
									  
									</div>
								  </div>
								
							  </div>
							  
							  
							</div>
	
						</div>
					</div>
	
					
					<div class="col-lg-4">
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
										<td>${{$total}}</td>
									</tr>
									<tr class="total-data">
										<td><strong>Shipping: </strong></td>
										<td>$45</td>
									</tr>
									<tr class="total-data">
										<td><strong>Total: </strong></td>
										<td>${{$total + 45}}</td>
									</tr>
								</tbody>
							</table>	
							<div class="cart-buttons">
								<h3>Pay method</h3>                           
								<label for="cashdelivery"><input type="radio" id="cashdelivery" name="optionsRadios" value="Cash on Delivery"> Cash on Delivery </label> <br>
								<label for="paypal"><input type="radio" id="paypal" name="optionsRadios" checked value="Via Paypal"> Via Paypal </label>
								<img src="https://www.paypalobjects.com/webstatic/mktg/logo/AM_mc_vs_dc_ae.jpg" border="0" alt="PayPal Acceptance Mark">    
								<input type="hidden" name="total" value="{{$total + 45}}">
								<a href="" class="boxed-btn black"> <button style="background-color: transparent;
									border: none;
									color: white;
									border-radius: 4px;
									cursor: pointer;" type="submit" class="boxed-btn black">Place Order</button></a>
								
							</div>
							
						</div>
	
						
						
					</div>
				</div>
				@csrf
			</form>
		</div>
	</div>
	<!-- end check out section -->

	
@endsection

						{{-- <div class="coupon-section">
							<h3>Apply Discount</h3>
							<div class="coupon-form-wrap">
								<form action="index.html">
									<p><input type="text" placeholder="Discount"></p>
									<p><input type="submit" value="Apply"></p>
								</form>
							</div>
						</div> --}}
						<!-- <div class="col-lg-4">
						<div class="order-details-wrap">
							<table class="order-details">
								<thead>
									<tr>
										<th>Your order Details</th>
										<th>Price</th>
									</tr>
								</thead>
								<tbody class="order-details-body">
									<tr>
										<td>Product</td>
										<td>Total</td>
									</tr>
									<tr>
										<td>Strawberry</td>
										<td>$85.00</td>
									</tr>
									<tr>
										<td>Berry</td>
										<td>$70.00</td>
									</tr>
									<tr>
										<td>Lemon</td>
										<td>$35.00</td>
									</tr>
								</tbody>
								<tbody class="checkout-details">
									<tr>
										<td>Subtotal</td>
										<td>$190</td>
									</tr>
									<tr>
										<td>Shipping</td>
										<td>$50</td>
									</tr>
									<tr>
										<td>Total</td>
										<td>$240</td>
									</tr>
								</tbody>
							</table>
							<a href="#" class="boxed-btn">Place Order</a>
						</div>
					</div> -->