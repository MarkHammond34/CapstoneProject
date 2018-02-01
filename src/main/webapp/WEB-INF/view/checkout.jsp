<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="https://www.paypalobjects.com/api/checkout.js"></script>
</head>

<body>
	<div id="paypal-button"></div>

	<script>
		paypal.Button.render({
			env : 'sandbox', // Or 'production',
			
			client: {
	            sandbox:    'AVGW1RKTj5gyUclN5wBmPk97pGaiTCsnR4AHZZ6QHsjDgraupasf1V8YbxMbKZLiBAJ-BwtkoUmIsfdf',
	            production: 'AUTi02B9WEFnsmjxP3XY2p2IljLU5HATmVK5yynF22kD3myoQhcQ7bKx2QF8CjiQRQ8-qyDJfgLwRd1u'
	        },

			commit : true, // Show a 'Pay Now' button

			style : {
				color : 'gold',
				size : 'small'
			},

			payment : function(data, actions) {
				/* 
				 * Set up the payment here 
				 */
				return actions.payment.create({
	                payment: {
	                    transactions: [
	                        {
	                            amount: { total: '1.00', currency: 'USD' }
	                        }
	                    ]
	                }
	            });
			},

			onAuthorize : function(data, actions) {
				/* 
				 * Execute the payment here 
				 */
				return actions.payment.execute().then(function(payment) {

	                // The payment is complete!
	                // You can now show a confirmation message to the customer
	            });
			}, 

			onCancel : function(data, actions) {
				/* 
				 * Buyer cancelled the payment 
				 */
			},

			onError : function(err) {
				/* 
				 * An error occurred during the transaction 
				 */
			}
		}, '#paypal-button');
	</script>
</body>
</html>