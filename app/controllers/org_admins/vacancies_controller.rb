class OrgAdmins::VacanciesController < ApplicationController

	before_action :authenticate_org_admin!

	def new
	  @vacancy = Vacancy.new
	end

	def create
	  begin
	    @vacancy = Vacancy.new(vacancy_params)
	    @vacancy.organization = @current_org_admin.organization
	    @vacancy.save!
	    redirect_to root_path
	  rescue
	  	flash.now[:error] = []
	   	@vacancy.errors.messages.each do |key, msg|
	        flash.now[:error].push("#{key.to_s.titleize} #{msg.join(',')}")
		end
        render action: "new"
	  end
	end

	private

    def vacancy_params
      params.require(:vacancy).permit(:title, :details, :experience, :required_skills, :no_of_vacancies)
    end
end
