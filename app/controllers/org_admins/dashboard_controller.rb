class OrgAdmins::DashboardController < ApplicationController

	before_action :authenticate_org_admin!

	def index
		@vacancies = Vacancy.where(organization: @current_org_admin.organization)
	end
end
