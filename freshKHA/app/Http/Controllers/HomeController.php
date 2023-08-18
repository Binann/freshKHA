<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Order_Detail;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class HomeController extends Controller
{
    public function index(){
        return view('layouts.home');
    }

    public function news(){
        return view('layouts.news');
    }

    public function cart(){
        return view('layouts.cart');
    }

    public function checkout(){
        if(!Auth::check()){
            return redirect()->route('login');
        }
        else{
            return view('layouts.checkout');
        }
    }

    public function checkoutPost(Request $request){
        
        $validator = Validator::make($request->all(), [
            'name' => 'required|string',
            'email' => 'required|email',
            'address' => 'required',
            'phone_number' => 'required', 
        ]);

        if($validator->fails()){
            return back()->withErrors($validator);
        }
       
       

        $order = new Order();
        $order -> userID = Auth::user()->id;
        $order -> name = $request -> name;
        $order -> email = $request -> email;
        $order -> address = $request -> address;
        $order -> phone_number = $request -> phone_number;
        $order -> total = $request -> total;
        $order -> pay_method = $request -> optionsRadios; 
        $order -> status = 'Waiting for confirm';
        $order -> save();
        $lastProductId = Order::orderBy('id', 'desc')
        ->value('id');

        $cart = session()->get('cart');

        foreach($cart as $item){
            $order_detail = new Order_Detail();
            $order_detail -> orderID = $lastProductId;
            $order_detail -> productID = $item['id'];
            $order_detail -> quantity = $item['quantity'];
            $order_detail -> save();
        };

        session()->forget('cart');
        return redirect()->route('checkout_success');

    }

    public function checkout_success(){
        return view('layouts.checkout_success');
    }

    public function contact(){
        return view('layouts.contact');
    }

    public function about(){
        return view('layouts.about');
    }

    public function getProduct(){  
        $products = Product::all();
        return view('layouts.shop', compact('products'));
    }

    public function getProductBySex(){
        return view('');
    }

    public function account(){
        return view('layouts.account');
    }
}
