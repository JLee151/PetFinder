/* global $, Stripe */
/* global stripeResponseHandler */
$(document).on('turbolinks:load', function() { // Document ready
	var stripeForm = $('#pro_form');
	var submitButton = $('#form-signup-btn');
	Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content')); // Set Stripe public key
	submitButton.click(function(event) {
		event.preventDefault(); // When user clicks form submit btn, prevent default submission behavior
		var ccNum = $('#card_number').val(), // Collect the credit card fields
			cvvNum = $('#card_code').val(),
			expMonth = $('#card_month').val(),
			expYear = $('#card_year').val();
		Stripe.createToken({ // Send the card info to Stripe
			number: ccNum,
			cvc: cvvNum,
			exp_month: expMonth,
			exp_year: expYear
		}, stripeResponseHandler);
	});
	// Stripe will return a card token. Inject card token as hidden field into form. Submit form to our Rails app.
});