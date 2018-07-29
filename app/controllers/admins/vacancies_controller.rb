class Admins::VacanciesController < ApplicationController
	before_action :authenticate_admin!

	def update
		vacancy = Vacancy.find(params[:id])
		vacancy.is_approved = true
		vacancy.save
		redirect_to root_path
	end
end
