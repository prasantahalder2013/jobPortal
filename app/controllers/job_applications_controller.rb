class JobApplicationsController < ApplicationController

	def new
		@job_application = JobApplication.new
	end

	def create
		begin
			vacancy = Vacancy.approved.find(params[:job_id])
			@job_application = JobApplication.new(apply_job_params)
			@job_application.vacancy = vacancy
			@job_application.save!
			redirect_to root_path
		rescue
			flash.now[:error] = []
	   			@job_application.errors.messages.each do |key, msg|
	        	flash.now[:error].push("#{msg.join(',')}")
			end
        	render action: "new"
		end
	end

	def accept_invitation
		job_application = JobApplication.find(params[:id])
		if job_application.may_accept?
			job_application.accept
			job_application.save!
			redirect_to root_path
		end
	end

	def reject_invitation
		job_application = JobApplication.find(params[:id])
		if job_application.may_reject?
			redirect_to add_note_path(id: job_application.id)
		end
	end

	def add_note
		@job_application = JobApplication.find(params[:id])
	end

	def create_note
	  job_application = JobApplication.find(params[:id])
	  job_application.note = params[:job_application][:note]
	  job_application.reject
	  job_application.save!
	  redirect_to root_path
	end

	private

    def apply_job_params
      params.require(:job_application).permit(:name, :email)
    end
end
