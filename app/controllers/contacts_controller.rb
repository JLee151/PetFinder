class ContactsController < ApplicationController
	
	# GET request to /contact-me
	def new
		@contact = Contact.new
	end
	
	# POST request for /contacts
	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			name = params[:contact][:name]
			email = params[:contact][:email]
			comment = params[:contact][:comments]
			ContactMailer.contact_email(name, email, comment).deliver
			flash[:success] = "Successfully sent message!"
			redirect_to new_contact_path
		else
			flash[:danger] = @contact.errors.full_messages.join(", ")
			redirect_to new_contact_path
		end
	end
	
	private
		# Strong parameters and whitelisting for form fields
		def contact_params
			params.require(:contact).permit(:name, :email, :comments)
		end
end