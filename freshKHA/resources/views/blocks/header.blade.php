<!-- header -->
<div class="top-header-area" id="sticker">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-sm-12 text-center">
                <div class="main-menu-wrap">
                    <!-- logo -->
                    <div class="site-logo">
                        <a href="index.html">
                            <img src="{{asset('assets/img/logo.png')}}" alt="">
                        </a>
                    </div>
                    <!-- logo -->

                    <!-- menu start -->
                    <nav class="main-menu">
                        <ul>
                            <li ><a href="{{route('home')}}">Home</a>                               
                            </li>
                            <li ><a href="{{route('shopPage.allProduct')}}">Shop</a>
                            </li>
                            <li><a href="{{route('news')}}">News</a>                           
                            </li>
                            <li><a href="{{route('about')}}">About</a></li>
                            <li><a href="{{route('contact')}}">Contact</a></li>
                            <li>
                                <div class="header-icons">
                                    <a class="shopping-cart" href="{{route('cart')}}"><i class="fas fa-shopping-cart"></i></a>
                                    <a class="mobile-hide search-bar-icon" href="#"><i class="fas fa-search"></i></a>
                                    @if (Auth::check())
                                        <a class="" href="{{route('account')}}"><i class="fas fa-user"></i></a>
                                        <a href="">
                                            <form action="{{route('logout')}}" method="POST" >
                                                @csrf
                                                @method('DELETE')
                                                <button style=" background-color: transparent;
                                                border: none;
                                                color: white;
                                                padding: 5px 20px;
                                                border-radius: 4px;
                                                cursor: pointer;">Logout</button>
                                            </form>       
                                        </a>          
                                        
                                    @else
                                        <a class="" href="{{route('login')}}">Login</i></a>
                                        <a class="" href="http://127.0.0.1:8000/admin/auth/login">Admin</i></a>
                                    @endif                                    
                                </div>
                            </li>
                        </ul>
                    </nav>
                    <a class="mobile-show search-bar-icon" href="#"><i class="fas fa-search"></i></a>
                    <div class="mobile-menu"></div>
                    <!-- menu end -->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end header -->

<!-- search area -->
<div class="search-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <span class="close-btn"><i class="fas fa-window-close"></i></span>
                <div class="search-bar">
                    <div class="search-bar-tablecell">
                        <h3>Search For:</h3>
                        <input type="text" placeholder="Keywords">
                        <button type="submit">Search <i class="fas fa-search"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end search area -->