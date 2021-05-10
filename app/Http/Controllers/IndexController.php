<?php

namespace App\Http\Controllers;

use App\Product;
use App\Category;

class IndexController extends Controller
{
	public function index()
	{
		// In Random order
		$featured = Product::inRandomOrder()->where('featured', 1)->paginate(8);
		$new = Product::inRandomOrder()->where('new', 1)->paginate(12);
		$popular = Product::inRandomOrder()->where('popular', 1)->paginate(12);
		$best = Product::inRandomOrder()->where('best', 1)->paginate(12);

		// Get all Categories and Sub Categories
		$categories = Category::with('categories')->where(['parent_id' => 0])->get();

		return view('index')->with(compact('featured', 'new', 'popular', 'best', 'categories'));
	}
}
