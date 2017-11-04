module UsersHelper
	def pet_type_icon
		if @user.profile.pet_type == "Dog"
			"<i class='fa fa-git'></i>".html_safe
		elsif @user.profile.pet_type == "Cat"
			"<i class='fa fa-modx'></i>".html_safe
		elsif @user.profile.pet_type == "Reptile"
			"<i class='fa fa-opera'></i>".html_safe
		elsif @user.profile.pet_type == "Bird"
			"<i class='fa fa-reddit'></i>".html_safe
		elsif @user.profile.pet_type == "Fish"
			"<i class='fa fa-vine'></i>".html_safe
		elsif @user.profile.pet_type == "Other"
			"<i class='fa fa-fb'></i>".html_safe
		end
	end
end