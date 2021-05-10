<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Category;
use App\Product;
use App\ProductsAttribute;
use App\ProductsImage;
use App\Coupon;
use App\User;
use App\Country;
use App\DeliveryAddress;
use App\Order;
use App\OrdersProduct;
use Carbon\Carbon;
use Dompdf\Dompdf;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Intervention\Image\ImageManagerStatic as Image;

class ProductsController extends Controller
{
    public function addProduct(Request $request)
    {

        if ($request->isMethod('post')) {
            $data = $request->all();
            if (empty($data['category_id'])) {
                return redirect()->back()->with('flash_message_error', 'Under Category is mmissing!');
            }
            $product = new Product;
            $product->category_id = $data['category_id'];
            $product->product_name = $data['product_name'];
            if (!empty($data['description'])) {
                $product->description = $data['description'];
            } else {
                $product->description = '';
            }

            $product->price = $data['price'];

            $product->price_two = $data['price_two'];

            // Upload Image
            if ($request->hasFile('image')) {
                $image_tmp = Input::file('image');
                if ($image_tmp->isValid()) {
                    $extension = $image_tmp->getClientOriginalExtension();
                    $filename = rand(111, 99999) . '.' . $extension;
                    $large_image_path = 'images/backend_images/products/large/' . $filename;
                    $medium_image_path = 'images/backend_images/products/medium/' . $filename;
                    $small_image_path = 'images/backend_images/products/small/' . $filename;
                    // resize images
                    Image::make($image_tmp)->save($large_image_path);
                    Image::make($image_tmp)->resize(600, 600)->save($medium_image_path);
                    Image::make($image_tmp)->resize(300, 300)->save($small_image_path);

                    // store image name in products table
                    $product->image = $filename;
                }
            }

            if (empty($data['status'])) {
                $status = 0;
            } else {
                $status = 1;
            }

            if (empty($data['featured'])) {
                $featured = 0;
            } else {
                $featured = 1;
            }

            if (empty($data['new'])) {
                $new = 0;
            } else {
                $new = 1;
            }

            if (empty($data['popular'])) {
                $popular = 0;
            } else {
                $popular = 1;
            }

            if (empty($data['best'])) {
                $best = 0;
            } else {
                $best = 1;
            }

            $product->status = $status;
            $product->featured = $featured;
            $product->new = $new;
            $product->popular = $popular;
            $product->best = $best;

            $product->save();
            return redirect()->back()->with('flash_message_success', 'Product has been added successfully!');
        }

        //Categories drop down start
        $categories = Category::where(['parent_id' => 0])->get();
        $categories_dropdown = "<option value='' selected disabled>Select</option>";
        foreach ($categories as $cat) {
            $categories_dropdown .= "<option value='" . $cat->id . "'>" . $cat->name . "</option>";
            $sub_categories = Category::where(['parent_id' => $cat->id])->get();
            foreach ($sub_categories as $sub_cat) {
                $categories_dropdown .= "<option value='" . $sub_cat->id . "'>&nbsp;--&nbsp;" . $sub_cat->name . "</option>";
            }
        }
        //Categories drop down ends 

        return view('admin.products.add_product')->with(compact('categories_dropdown'));
    }

    public function editProduct(Request $request, $id = null)
    {

        if ($request->isMethod('post')) {
            $data = $request->all();


            // Upload Image
            if ($request->hasFile('image')) {
                $image_tmp = Input::file('image');
                if ($image_tmp->isValid()) {
                    $extension = $image_tmp->getClientOriginalExtension();
                    $filename = rand(111, 99999) . '.' . $extension;
                    $large_image_path = 'images/backend_images/products/large/' . $filename;
                    $medium_image_path = 'images/backend_images/products/medium/' . $filename;
                    $small_image_path = 'images/backend_images/products/small/' . $filename;
                    // resize images
                    Image::make($image_tmp)->save($large_image_path);
                    Image::make($image_tmp)->resize(600, 600)->save($medium_image_path);
                    Image::make($image_tmp)->resize(300, 300)->save($small_image_path);
                }
            } else {
                $filename = $data['current_image'];
            }

            if (empty($data['description'])) {
                $data['description'] = '';
            }

            if (empty($data['status'])) {
                $status = 0;
            } else {
                $status = 1;
            }

            if (empty($data['featured'])) {
                $featured = 0;
            } else {
                $featured = 1;
            }

            if (empty($data['new'])) {
                $new = 0;
            } else {
                $new = 1;
            }

            if (empty($data['popular'])) {
                $popular = 0;
            } else {
                $popular = 1;
            }

            if (empty($data['best'])) {
                $best = 0;
            } else {
                $best = 1;
            }

            Product::where(['id' => $id])->update(['category_id' => $data['category_id'], 'product_name' => $data['product_name'], 'description' => $data['description'], 'price' => $data['price'], 'price_two' => $data['price_two'], 'image' => $filename, 'status' => $status, 'featured' => $featured, 'new' => $new, 'popular' => $popular, 'best' => $best]);
            return redirect()->back()->with('flash_message_success', 'Product has been updated successfully!');
        }

        //Get Product Details
        $productDetails = Product::where(['id' => $id])->first();

        //Categories drop down start
        $categories = Category::where(['parent_id' => 0])->get();
        $categories_dropdown = "<option value='' selected disabled>Select</option>";
        foreach ($categories as $cat) {
            if ($cat->id == $productDetails->category_id) {
                $selected = "selected";
            } else {
                $selected = "";
            }
            $categories_dropdown .= "<option value='" . $cat->id . "' " . $selected . ">" . $cat->name . "</option>";
            $sub_categories = Category::where(['parent_id' => $cat->id])->get();
            foreach ($sub_categories as $sub_cat) {
                if ($sub_cat->id == $productDetails->category_id) {
                    $selected = "selected";
                } else {
                    $selected = "";
                }
                $categories_dropdown .= "<option value='" . $sub_cat->id . "' " . $selected . ">&nbsp;--&nbsp;" . $sub_cat->name . "</option>";
            }
        }

        //Categories drop down ends 
        return view('admin.products.edit_product')->with(compact('productDetails', 'categories_dropdown'));
    }

    public function viewProducts(Request $request)
    {
        $products = Product::orderby('id', 'DESC')->get();
        $products = json_decode(json_encode($products));
        foreach ($products as $key => $val) {
            $category_name = Category::where(['id' => $val->category_id])->first();
            $products[$key]->category_name = $category_name->name;
        }
        return view('admin.products.view_products')->with(compact('products'));
    }

    public function deleteProduct($id = null)
    {
        Product::where(['id' => $id])->delete();
        return redirect()->back()->with('flash_message_success', 'Product has been deleted successfully!');
    }

    public function deleteProductImage($id = null)
    {

        // Get Product Image Name
        $productImage = Product::where(['id' => $id])->first();

        // Get Product Image Paths
        $large_image_path = 'images/backend_images/products/large/';
        $medium_image_path = 'images/backend_images/products/medium/';
        $small_image_path = 'images/backend_images/products/small/';

        // Delete Large image if not exists in Folder
        if (file_exists($large_image_path . $productImage->image)) {
            unlink($large_image_path . $productImage->image);
        }

        // Delete medium image if not exists in Folder
        if (file_exists($medium_image_path . $productImage->image)) {
            unlink($medium_image_path . $productImage->image);
        }

        // Delete small image if not exists in Folder
        if (file_exists($small_image_path . $productImage->image)) {
            unlink($small_image_path . $productImage->image);
        }

        // Delete Image from Products table
        Product::where(['id' => $id])->update(['image' => '']);

        return redirect()->back()->with('flash_message_success', 'Product Image has been deleted successfully!');
    }

    public function deleteAltImage($id = null)
    {

        // Get Product Image Name
        $productImage = ProductsImage::where(['id' => $id])->first();

        // Get Product Image Paths
        $large_image_path = 'images/backend_images/products/large/';
        $medium_image_path = 'images/backend_images/products/medium/';
        $small_image_path = 'images/backend_images/products/small/';

        // Delete Large image if not exists in Folder
        if (file_exists($large_image_path . $productImage->image)) {
            unlink($large_image_path . $productImage->image);
        }

        // Delete medium image if not exists in Folder
        if (file_exists($medium_image_path . $productImage->image)) {
            unlink($medium_image_path . $productImage->image);
        }

        // Delete small image if not exists in Folder
        if (file_exists($small_image_path . $productImage->image)) {
            unlink($small_image_path . $productImage->image);
        }

        // Delete Image from Products table
        ProductsImage::where(['id' => $id])->delete();

        return redirect()->back()->with('flash_message_success', 'Product Alternate Image(s) has been deleted successfully!');
    }

    public function addAttributes(Request $request, $id = null)
    {
        $productDetails = Product::with('attributes')->where(['id' => $id])->first();
        if ($request->isMethod('post')) {
            $data = $request->all();

            foreach ($data['name'] as $key => $val) {
                if (!empty($val)) {

                    $attribute = new ProductsAttribute;
                    $attribute->product_id = $id;
                    $attribute->name = $data['name'][$key];
                    $attribute->description = $data['description'][$key];
                    $attribute->save();
                }
            }
            return redirect('admin/add-attributes/' . $id)->with('flash_message_success', 'Product Attributes has been added successfully!');
        }
        return view('admin.products.add_attributes')->with(compact('productDetails'));
    }

    public function editAttributes(Request $request, $id = null)
    {
        if ($request->isMethod('post')) {
            $data = $request->all();

            foreach ($data['idAttr'] as $key => $attr) {
                ProductsAttribute::where(['id' => $data['idAttr'][$key]])->update(['price' => $data['price'][$key], 'stock' => $data['stock'][$key]]);
            }
            return redirect()->back()->with('flash_message_success', 'Products Attributes has been update successfully!');
        }
    }

    public function addImages(Request $request, $id = null)
    {
        $productDetails = Product::with('attributes')->where(['id' => $id])->first();

        if ($request->isMethod('post')) {
            $data = $request->all();
            if ($request->hasFile('image')) {
                $files = $request->file('image');
                foreach ($files as $file) {
                    // Upload Images after resize
                    $image = new ProductsImage;
                    $extension = $file->getClientOriginalExtension();
                    $fileName = rand(111, 99999) . '.' . $extension;
                    $large_image_path = 'images/backend_images/products/large/' . $fileName;
                    $medium_image_path = 'images/backend_images/products/medium/' . $fileName;
                    $small_image_path = 'images/backend_images/products/small/' . $fileName;
                    Image::make($file)->save($large_image_path);
                    Image::make($file)->resize(600, 600)->save($medium_image_path);
                    Image::make($file)->resize(300, 300)->save($small_image_path);
                    $image->image = $fileName;
                    $image->product_id = $data['product_id'];
                    $image->save();
                }
            }
            return redirect('admin/add-images/' . $id)->with('flash_message_success', 'Product Image has been added successfully');
        }

        $productsImg = ProductsImage::where(['product_id' => $id])->get();
        $productsImg = json_decode(json_encode($productsImg));

        $productsImages = "";
        foreach ($productsImg as $img) {
            $productsImages .= "<tr>
                <td>" . $img->id . "</td>
                <td>" . $img->product_id . "</td>
                <td><img style='width:150px' src='/images/backend_images/products/small/$img->image'></td>
                <td>
           <a rel='$img->id' rel1='delete-alt-image' href='javascript:' class='btn btn-danger btn-mmini deleteRecord' title='Delete Product Image'>Delete</a>
                 </td>
              </tr>";
        }

        return view('admin.products.add_images')->with(compact('productDetails', 'productsImages'));
    }

    public function deleteAttribute($id = null)
    {
        ProductsAttribute::where(['id' => $id])->delete();
        return redirect()->back()->with('flash_message_success', 'Attribute has been deleted successfully!');
    }

    public function products($url = null)
    {
        // Show 404 page if Category URL does not exist
        $countCategory = Category::where(['url' => $url, 'status' => 1])->count();
        if ($countCategory == 0) {
            abort(404);
        }

        // Get all Categories and Sub Categories
        $categories = Category::with('categories')->where(['parent_id' => 0])->get();

        $categoryDetails = Category::where(['url' => $url])->first();

        if ($categoryDetails->parent_id == 0) {
            // If url is main Category url
            $subCategories = Category::where(['parent_id' => $categoryDetails->id])->get();
            foreach ($subCategories as $subcat) {
                $cat_ids[] = $subcat->id;
            }
            $productsAll = Product::whereIn('category_id', $cat_ids)->where('status', 1)->paginate(16);
        } else {
            // If url is sub category url
            $productsAll = Product::where(['category_id' => $categoryDetails->id])->where('status', 1)->paginate(16);
        }

        return view('products.listing')->with(compact('categories', 'categoryDetails', 'productsAll'));
    }

    public function searchProducts(Request $request)
    {
        $data = $request->all();

        $categories = Category::with('categories')->where(['parent_id' => 0])->get();

        $search_product = $data['product'];

        $productsAll = Product::query()
            ->where(function ($query) use ($search_product) {
                $query->where('product_name', 'like', '%' . $search_product . '%')
                    ->orwhere('product_code', $search_product);
            })
            ->where('status', 1)
            ->paginate(9);

        return view('products.listing')->with([
            'categories' => $categories,
            'productsAll' => $productsAll,
            'search_product' => $search_product,
        ]);
    }

    public function product($id = null)
    {

        // Show 404 page if product is disabled
        $productsCount = Product::where(['id' => $id, 'status' => 1])->count();
        if ($productsCount == 0) {
            abort(404);
        }

        // Get Product Details 
        $productDetails = Product::with('attributes')->where('id', $id)->first();
        $productDetails = json_decode(json_encode($productDetails));

        $relatedProducts = Product::orderBy('id', 'DESC')->paginate(8);

        // Get all Categories and Sub Categories
        $categories = Category::with('categories')->where(['parent_id' => 0])->get();

        // Get Product Alternate Images
        $productAltImages = ProductsImage::where('product_id', $id)->get();

        return view('products.detail')->with(compact('productDetails', 'categories', 'productAltImages', 'relatedProducts'));
    }

    public function addtocart(Request $request)
    {

        Session::forget('CouponAmount');
        Session::forget('CouponCode');

        $data = $request->all();

        if (!empty($data['wishListButton']) && $data['wishListButton'] == "Wish List") {

            // Check User is logged in
            if (!Auth::check()) {
                return redirect()->back()->with('flash_message_error', 'Please login to add product in your Wish List');
            }

            // Get User Email/Username
            $user_email = Auth::user()->email;

            // Set Quantity as 1
            $quantity = 1;

            // Get Current Date
            $created_at = Carbon::now();

            $wishListCount = DB::table('wish_list')->where(['user_email' => $user_email, 'product_id' => $data['product_id']])->count();

            if ($wishListCount > 0) {
                return redirect()->back()->with('flash_message_error', 'Please already exists in Wish List!');
            } else {

                // Insert Product in Wish List
                DB::table('wish_list')->insert(['product_id' => $data['product_id'], 'product_name' => $data['product_name'], 'price' => $data['price'], 'quantity' => $quantity, 'user_email' => $user_email, 'created_at' => $created_at]);
                return redirect()->back()->with('flash_message_success', 'Product has been added in Wish List');
            }
        } else {

            // if product added from Wish List
            if (!empty($data['cartButton']) && $data['cartButton'] == "Add to Cart") {
                $data['quantity'] = 1;
            }

            if (empty(Auth::user()->email)) {
                $data['user_email'] = '';
            } else {
                $data['user_email'] = Auth::user()->email;
            }

            $session_id = Session::get('session_id');
            if (!isset($session_id)) {
                $session_id = str_random(40);
                Session::put('session_id', $session_id);
            }

            if (empty(Auth::check())) {
                $countProducts = DB::table('cart')->where(['product_id' => $data['product_id'], 'session_id' => $session_id])->count();
                if ($countProducts > 0) {
                    return redirect()->back()->with('flash_message_error', 'Product already exists in Cart!');
                }
            } else {
                $countProducts = DB::table('cart')->where(['product_id' => $data['product_id'], 'user_email' => Auth::user()->email])->count();
                if ($countProducts > 0) {
                    return redirect()->back()->with('flash_message_error', 'Product already exists in Cart!');
                }
            }

            DB::table('cart')->insert(['product_id' => $data['product_id'], 'product_name' => $data['product_name'], 'price' => $data['price'], 'quantity' => $data['quantity'], 'user_email' => $data['user_email'], 'session_id' => $session_id]);

            return redirect('/cart')->with('flash_message_success', 'Product has been added in Cart!');
        }
    }

    public function cart()
    {
        if (Auth::check()) {
            $user_email = Auth::user()->email;
            $userCart = DB::table('cart')->where(['user_email' => $user_email])->get();
        } else {
            $session_id = Session::get('session_id');
            $userCart = DB::table('cart')->where(['session_id' => $session_id])->get();
        }

        foreach ($userCart as $key => $product) {
            $productDetails = Product::where('id', $product->product_id)->first();
            $userCart[$key]->image = $productDetails->image;
        }

        return view('products.cart')->with(compact('userCart'));
    }

    public function wishList()
    {
        if (Auth::check()) {
            $user_email = Auth::user()->email;
            $userWishList = DB::table('wish_list')->where('user_email', $user_email)->get();
            foreach ($userWishList as $key => $product) {
                $productDetails = Product::where('id', $product->product_id)->first();
                $userWishList[$key]->image = $productDetails->image;
            }
        } else {
            $userWishList = array();
        }

        return view('products.wish_list')->with(compact('userWishList'));
    }

    public function updateCartQuantity($id = null, $quantity = null)
    {
        Session::forget('CouponAmount');
        Session::forget('CouponCode');
        $getProductSKU = DB::table('cart')->select('quantity')->where('id', $id)->first();
        $updated_quantity = $getProductSKU->quantity + $quantity;
        if (true) {
            DB::table('cart')->where('id', $id)->increment('quantity', $quantity);
            return redirect('cart')->with('flash_message_success', 'Product Quantity has been updated in Cart!');
        } else {
            return redirect('cart')->with('flash_message_error', 'Required Product Quantity is not available!');
        }
    }

    public function deleteCartProduct($id = null)
    {
        Session::forget('CouponAmount');
        Session::forget('CouponCode');
        DB::table('cart')->where('id', $id)->delete();
        return redirect('cart')->with('flash_message_success', 'Product has been deleted in Cart!');
    }

    public function applyCoupon(Request $request)
    {

        Session::forget('CouponAmount');
        Session::forget('CouponCode');

        $data = $request->all();
        $couponCount = Coupon::where('coupon_code', $data['coupon_code'])->count();
        if ($couponCount == 0) {
            return redirect()->back()->with('flash_message_error', 'This coupon does not exits!');
        } else {
            // with perform other like Active/Inactive, Expiry date...

            // Get Coupon Details
            $couponDetails = Coupon::where('coupon_code', $data['coupon_code'])->first();

            // if coupon is Inactive
            if ($couponDetails->status == 0) {
                return redirect()->back()->with('flash_message_error', 'This coupon is not active!');
            }

            // If coupon is Expired
            $expiry_date = $couponDetails->expiry_date;
            $current_date = date('Y-m-d');
            if ($expiry_date < $current_date) {
                return redirect()->back()->with('flash_message_error', 'This coupon is expired!');
            }

            // Coupon is Valid for Discount

            // Get Cart Total Amount
            $session_id = Session::get('session_id');
            $userCart = DB::table('cart')->where(['session_id' => $session_id])->get();
            $total_amount = 0;
            foreach ($userCart as $item) {
                $total_amount = $total_amount + ($item->price * $item->quantity);
            }

            // Check if amount type is Fixed or Percentage
            if ($couponDetails->amount_type == "Fixed") {
                $couponAmount = $couponDetails->amount;
            } else {
                $couponAmount = $total_amount * ($couponDetails->amount / 100);
            }

            // Add Coupon Code & Amount inn Session
            Session::put('CouponAmount', $couponAmount);
            Session::put('CouponCode', $data['coupon_code']);

            return redirect()->back()->with('flash_message_success', 'Coupon code successfully applied. You are availing discount!');
        }
    }

    public function checkout(Request $request)
    {
        $user_id = Auth::user()->id;
        $user_email = Auth::user()->email;
        $userDetails = User::find($user_id);
        $countries = Country::get();

        // Check if Shipping Address exists
        $shippingCount = DeliveryAddress::where('user_id', $user_id)->count();
        $shippingDetails = array();
        if ($shippingCount > 0) {
            $shippingDetails = DeliveryAddress::where('user_id', $user_id)->first();
        }

        // Update cart table with user email 
        $session_id = Session::get('session_id');
        DB::table('cart')->where(['session_id' => $session_id])->update(['user_email' => $user_email]);

        if ($request->isMethod('post')) {
            $data = $request->all();

            if ($shippingCount > 0) {
                // Update Shipping Address
                DeliveryAddress::where('user_id', $user_id)->update(['mobile' => $data['mobile'], 'address' => $data['address'], 'city' => $data['city']]);
            } else {
                // Add New Shipping Address
                $shipping = new DeliveryAddress;
                $shipping->user_id = $user_id;
                $shipping->user_email = $user_email;
                $shipping->mobile = $data['mobile'];
                $shipping->address = $data['address'];
                $shipping->city = $data['city'];
                $shipping->save();
            }
            return redirect()->action('ProductsController@orderReview');
        }

        return view('products.checkout')->with(compact('userDetails', 'countries', 'shippingDetails'));
    }

    public function orderReview()
    {
        $user_id = Auth::user()->id;
        $user_email = Auth::user()->email;
        $userDetails = User::where('id', $user_id)->first();
        $shippingDetails = DeliveryAddress::where('user_id', $user_id)->first();
        $shippingDetails = json_decode(json_encode($shippingDetails));
        $userCart = DB::table('cart')->where(['user_email' => $user_email])->get();
        foreach ($userCart as $key => $product) {
            $productDetails = Product::where('id', $product->product_id)->first();
            $userCart[$key]->image = $productDetails->image;
        }
        return view('products.order_review')->with(compact('userDetails', 'shippingDetails', 'userCart'));
    }

    public function placeOrder(Request $request)
    {
        if ($request->isMethod('post')) {
            $data = $request->all();
            $user_id = Auth::user()->id;
            $user_email = Auth::user()->email;
            $user_name = Auth::user()->name;

            // Get Shipping Address of User
            $shippingDetails = DeliveryAddress::where(['user_email' => $user_email])->first();

            if (empty(Session::get('CouponCode'))) {
                $coupon_code = '';
            } else {
                $coupon_code = Session::get('CouponCode');
            }

            if (empty(Session::get('CouponAmount'))) {
                $coupon_amount = '';
            } else {
                $coupon_amount = Session::get('CouponAmount');
            }

            // $grand_total = Product::getGrandTotal();

            $order = new Order;
            $order->user_id = $user_id;
            $order->user_email = $user_email;
            $order->name = $user_name;
            $order->address = $shippingDetails->address;
            $order->city = $shippingDetails->city;
            $order->mobile = $shippingDetails->mobile;
            $order->coupon_code = $coupon_code;
            $order->coupon_amount = $coupon_amount;
            $order->order_status = "New";
            $order->payment_method = $data['payment_method'];
            $order->grand_total = $data['grand_total'];
            $order->save();

            $order_id = DB::getPdo()->lastInsertId();

            $cartProducts = DB::table('cart')->where(['user_email' => $user_email])->get();
            foreach ($cartProducts as $pro) {
                $cartPro = new OrdersProduct;
                $cartPro->order_id = $order_id;
                $cartPro->user_id = $user_id;
                $cartPro->product_id = $pro->product_id;
                $cartPro->product_name = $pro->product_name;
                $cartPro->product_price = $pro->price;
                $cartPro->product_qty = $pro->quantity;
                $cartPro->save();
            }

            Session::put('order_id', $order_id);
            Session::put('grand_total', $data['grand_total']);

            if ($data['payment_method'] == "Payme") {
                // Redirect user to thanks page after saving order
                return redirect('/payme');
            } else {
                // Paypal - Redirect user to paypal page after saving order
                return redirect('/paypal');
            }
        }
    }

    public function payme(Request $request)
    {
        $user_email = Auth::user()->email;
        DB::table('cart')->where('user_email', $user_email)->delete();
        return view('orders.payme');
    }

    public function thanks(Request $request)
    {
        $user_email = Auth::user()->email;
        DB::table('cart')->where('user_email', $user_email)->delete();
        return view('orders.thanks');
    }

    public function thanksPaypal()
    {
        return view('orders.thanks_paypal');
    }

    public function paypal(Request $request)
    {
        $user_email = Auth::user()->email;
        DB::table('cart')->where('user_email', $user_email)->delete();
        return view('orders.paypal');
    }

    public function cancelPaypal()
    {
        return view('orders.cancel_paypal');
    }

    // public function userOrders()
    // {
    //     $user_id = Auth::user()->id;
    //     $orders = Order::with('orders')->where('user_id', $user_id)->orderBy('id', 'DESC')->get();
    //     return view('orders.user_orders')->with(compact('orders'));
    // }

    public function userOrderDetails($order_id)
    {
        $user_id = Auth::user()->id;
        $orderDetails = Order::with('orders')->where('id', $order_id)->first();
        $orderDetails = json_decode(json_encode($orderDetails));

        return view('orders.user_order_details')->with(compact('orderDetails'));
    }

    public function viewOrders()
    {
        $orders = Order::with('orders')->orderBy('id', 'Desc')->get();
        $orders = json_decode(json_encode($orders));
        return view('admin.orders.view_orders')->with(compact('orders'));
    }

    public function viewOrderDetails($order_id)
    {
        $orderDetails = Order::with('orders')->where('id', $order_id)->first();
        //$orderDetails = json_decode(json_encode('orderDetails'));
        $user_id = $orderDetails->user_id;
        $userDetails = User::where('id', $user_id)->first();

        return view('admin.orders.order_details')->with(compact('orderDetails', 'userDetails'));
    }

    public function viewOrderInvoice($order_id)
    {
        $orderDetails = Order::with('orders')->where('id', $order_id)->first();
        //$orderDetails = json_decode(json_encode('orderDetails'));
        $user_id = $orderDetails->user_id;
        $userDetails = User::where('id', $user_id)->first();

        return view('admin.orders.order_invoice')->with(compact('orderDetails', 'userDetails'));
    }

    public function viewPDFInvoice($order_id)
    {
        $orderDetails = Order::with('orders')->where('id', $order_id)->first();
        //$orderDetails = json_decode(json_encode('orderDetails'));
        $user_id = $orderDetails->user_id;
        $userDetails = User::where('id', $user_id)->first();

        include './invoice.php';

        // instantiate and use the dompdf class
        $dompdf = new Dompdf();
        $dompdf->loadHtml($output);

        // (Optional) Setup the paper size and orientation
        $dompdf->setPaper('A4', 'landscape');

        // Render the HTML as PDF
        $dompdf->render();

        // Output the generated PDF to Browser
        $dompdf->stream();
    }

    public function updateOrderStatus(Request $request)
    {
        if ($request->isMethod('post')) {
            $data = $request->all();
            Order::where('id', $data['order_id'])->update(['order_status' => $data['order_status']]);
            return redirect()->back()->with('flash_message_success', 'Order Status has been updated successfully!');
        }
    }

    public function deleteWishListProduct($id)
    {
        DB::table('wish_list')->where('id', $id)->delete();
        return redirect()->back()->with('flash_message_success', 'Saralanganlardan o\'chirildi');
    }
}
