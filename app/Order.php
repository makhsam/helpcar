<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $table = 'orders';

    public function orders()
    {
        return $this->hasMany('App\OrdersProduct', 'order_id');
    }

    public static function getOrderDetails($order_id)
    {
        return self::where('id', $order_id)->first();
    }

    public static function getCountryCode($country)
    {
        return Country::where('country_name', $country)->first();
    }
}
