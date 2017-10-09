/* global $, Stripe */
$(document).on('turbolinks:load', function() { // Document ready
	var stripeForm = $('#pro_form');
	var submitButton = $('#form-signup-btn');
	Stripe.setPublishableKey( $('meta[name="stripe-key"]').attr('content') ); // Set Stripe public key
	submitButton.click(function(event) {
		event.preventDefault(); // When user clicks form submit btn, prevent default submission behavior
		submitButton.val("Processing").prop('disabled', true);

		var ccNum = $('#card_number').val(), // Collect the credit card fields
			cvvNum = $('#card_code').val(),
			expMonth = $('#card_month').val(),
			expYear = $('#card_year').val();

		var error = false; // Use Stripe JS library to check for card errors
		if(!Stripe.card.validateCardNumber(ccNum)) { // Validate card number
			error = true;
			alert('The credit card number appears to be invalid!');
		}
		if(!Stripe.card.validateCVC(cvvNum)) { // Validate CVV number
			error = true;
			alert('The CVV number appears to be invalid!');
		}
		if(!Stripe.card.validateExpiry(expMonth, expYear)) { // Validate expiration date
			error = true;
			alert('The expiration date/year appears to be invalid!');
		}

		if(error) {
			submitButton.prop('disabled', false).val("Sign Up");
		} else {
			Stripe.createToken({ // Send the card info to Stripe
				number: ccNum,
				cvc: cvvNum,
				exp_month: expMonth,
				exp_year: expYear
			}, stripeResponseHandler);
		}
		return false;
	});

	function stripeResponseHandler(status, response) { // Stripe will return a card token
		var token = response.id;
		stripeForm.append( $('<input type="hidden" name="user[stripe_card_token]">').val(token) ); //Inject card token into hidden field
		stripeForm.get(0).submit(); // Submit form to Rails app
	}
});