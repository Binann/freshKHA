@extends('index')

@section('title')
    Shop
@endsection

@section('content')
    	<!-- breadcrumb-section -->
	<div class="breadcrumb-section breadcrumb-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="breadcrumb-text">
						<p>Fresh and Organic</p>
						<h1>Shop</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->

	<!-- products -->
	<div class="product-section mt-150 mb-150">
		<div class="container">
			<div class="row">
                <div class="col-md-12">
                    <div class="product-filters">
                        <ul>
                            <li class="active" data-filter="*">All</li>
                            <li data-filter=".1">Fruit</li>
                            <li data-filter=".2">Vegetable</li>
                            <li data-filter=".3">Nut</li>

                        </ul>
                    </div>
                </div>
            </div>
			<div class="row product-lists">
				@foreach ($products as $product)
					<div class="col-lg-4 col-md-6 text-center {{$product->categoryID}}">
						<div class="single-product-item">
							<div class="product-image">
								<a href="{{route('product_detail', ['id' => $product->id])}}"><img src="{{asset('storage/'.$product->img)}}" alt=""></a>
							</div>
							<h3>{{$product->name}}</h3>
							<p class="product-price"><span>Per Kg</span> ${{$product->price}} </p>
							<a href="{{route('add_to_cart', ['id' => $product->id])}}" class="cart-btn "><i class="fas fa-shopping-cart"></i> Add to Cart</a>
						</div>
					</div>
				@endforeach
			</div>

			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="pagination-wrap">
						<ul>
							<li><a href="#">Prev</a></li>
							<li><a href="#">1</a></li>
							<li><a class="active" href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">Next</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end products -->
@endsection

@section('js')
<script>
	// function addToCart(event){
	
	//   event.preventDefault();
	//   let urlCart = $(this).data('url');
	//   $.ajax({
	// 	type:"GET",
	// 	url: urlCart,
	// 	dataType: 'json',
	// 	success: function(data){
	// 	  if(data.code === 200){
	// 		alert('Add to Cart successful');
	// 	  }
	// 	},
	// 	error: function(){

	// 	}
	//   });
	// }
	// $(function(){
	//   $('.add_to_cart').on('click', addToCart);
	// });
  </script>
@endsection