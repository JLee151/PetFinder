class ProfilesController < ApplicationController
	# GET to /users/:user_id/profile/new
	def new
		# Render blank profile details form
		@profile = Profile.new
	end

	def create
		# Ensure that we have the user who is filling out form
		@user = User.find( params[:user_id] )
		# Create profile linked to this specific user
		@profile = @user.build_profile( profile_params )
		if @profile.save
			flash[:success] = "Profile updated!"
			redirect_to user_path( params[:user_id] )
		else
			render action: :new
		end
	end

	private
		def profile_params
			params.require(:profile).permit(:first_name, :last_name, :avatar, :pet_type, :phone_number, :contact_email, :description)
		end
end