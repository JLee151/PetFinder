class ContactMailer < ActionMailer::Base
	default to: 'jordanlee151@gmail.com'
	
	def contact_email(name, email, comment)
		@name = name
		@email = email
		@comment = comment
		
		mail(from: email, subject: "SaaS App Contact Form Message from #{name}!")
	end
end