class OrgAdmins::JobApplicationsController < ApplicationController

	before_action :authenticate_org_admin!

	def index
		@job_applications = @current_org_admin.organization.job_applications.includes(:vacancy)
	end

	def edit
		@job_application = JobApplication.find(params[:id])
	end

	def update
	  job_application = JobApplication.find(params[:id])
	  job_application.date_time = params[:job_application][:date_time]
	  job_application.invite
	  job_application.save!
	  redirect_to org_admins_job_applications_path
	end
end
