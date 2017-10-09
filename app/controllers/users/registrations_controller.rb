class Users::RegistrationsController < Devise::RegistrationsController
	# Extend default Devise gem behavior so subscription users are accounted for
	def create
		super do |resource|
			if params[:plan]
				resource.plan_id = params[:plan]
				if resource.plan_id == 2
					resource.save_with_subscription
				else
					resource.save
				end
			end
		end
	end
end