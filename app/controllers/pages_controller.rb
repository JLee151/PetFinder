class PagesController < ApplicationController

	# GET request for / -> home page
	def home
		@base_plan = Plan.find(1)
		@pro_plan = Plan.find(2)
	end

	def about

	end
end