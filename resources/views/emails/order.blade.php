<!DOCTYPE html>
<html>
<body>
    <table width="700px">
    	<tr><td>&nbsp;</td></tr>
    	<!-- <tr><td><img src="{{ asset('/images/frontend_images/home/logo.png') }}"></td></tr> -->
    	<tr><td>&nbsp;</td></tr>
    	<tr><td>Hello {{ $name }},</td></tr>
    	<tr><td>&nbsp;</td></tr>
    	<tr><td>Thanks you for shopping with us. Your order details are as below :-</td></tr>
    	<tr><td>&nbsp;</td></tr>
    	<tr><td>Order No: {{ $order_id }}</td></tr>
    	<tr><td>&nbsp;</td></tr>
    </table>
</body>
</html>