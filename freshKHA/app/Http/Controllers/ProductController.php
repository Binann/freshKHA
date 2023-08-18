<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function addToCart($id){
        $product = Product::find($id);     
        $cart = session()->get('cart');
        if(isset($cart[$id])){          
            $cart[$id]['quantity'] = $cart[$id]['quantity'] + 1;
        }else {
            $cart[$id] = [
                'id' => $product->id,
                'name' => $product->name,
                'price'=> $product->price,
                'link_img' => $product->img,
                'quantity' => 1,                 
            ];
            
        }

        session()->put('cart' , $cart );
        return back()->with('message', 'add to cart successfully');
    }

    public function editCart($slug, $id){
        $cart = session()->get('cart');
        if($slug === 'minus'){
            $cart[$id]['quantity'] = $cart[$id]['quantity'] - 1;
            if($cart[$id]['quantity'] == 0){
                unset($cart[$id]);
            }
        } else {
            $cart[$id]['quantity'] = $cart[$id]['quantity'] + 1;
        }
        session()->put('cart' , $cart );

        return back();
    }

    public function remove_product_in_cart($id){
        $cart = session()->get('cart');
        unset($cart[$id]);
        session()->put('cart' , $cart );
        return back();
    }

    public function product_detail($id){
        $product = Product::select('products.*', 'categories.category_name')
        ->join('categories', 'products.categoryID', '=', 'categories.id')
        ->where('products.id', $id)
        ->first();
        $products = Product::where('products.categoryID', $product->categoryID)->get(); 
        
        return view('layouts.product-detail', compact('product', 'products'));
    }
}
