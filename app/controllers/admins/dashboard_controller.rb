class Admins::DashboardController < ApplicationController

	before_action :authenticate_admin!

	def index
		@vacancies = Vacancy.all
	end
end
