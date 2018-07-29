class JobsController < ApplicationController

	def index
		@vacancies = Vacancy.approved.order(created_at: :desc)
	end
end
