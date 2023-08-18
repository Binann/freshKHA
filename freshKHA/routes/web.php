<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ProductController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/



Route::get('/',[HomeController::class, 'index'])->name('home');

Route::get('/news',[HomeController::class, 'news'])->name('news');

Route::get('/cart', [HomeController::class, 'cart'])->name('cart');

Route::get('/checkout', [HomeController::class, 'checkout'])->name('checkout');

Route::post('/checkout', [HomeController::class, 'checkoutPost'])->name('checkoutPost');

Route::get('/checkout-success', [HomeController::class, 'checkout_success'])->name('checkout_success');

Route::get('/register',[AuthController::class, 'register'])->name('register');

Route::post('/register',[AuthController::class, 'registerPost'])->name('registerPost');

Route::get('/login-user',[AuthController::class, 'login'])->name('login');
Route::post('/login-user',[AuthController::class, 'loginPost'])->name('loginPost');

Route::delete('/logout',[AuthController::class, 'logout'])->name('logout');

Route::get('/contact',[HomeController::class, 'contact'])->name('contact');

Route::get('/about',[HomeController::class, 'about'])->name('about');

Route::get('/account',[HomeController::class, 'account'])->name('account');

Route::prefix('shop-page')->name('shopPage.')->group(function(){
    Route::get('/', [HomeController::class, 'getProduct'])->name('allProduct');
    Route::get('/{slug}/{categoryID?}', [HomeController::class, 'getProductBySex'])->name('productBySex');    
});

Route::get('/product/product-detail/{id}', [ProductController::class, 'product_detail'])->name('product_detail');

Route::get('/product/add-to-cart/{id}', [ProductController::class, 'addToCart'])->name('add_to_cart');
Route::get('/edit_cart/{slug}/{id}', [ProductController::class, 'editCart'])->name('edit_cart');
Route::get('/remove/{id}', [ProductController::class, 'remove_product_in_cart'])->name('remove_product_in_cart');

