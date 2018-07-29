class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_org_admin!
  	if current_org_admin.present?
  		@current_org_admin = current_org_admin
  	else
  		redirect_to root_path
  	end
  end

  def authenticate_admin!
  	if current_admin.present?
  		@current_admin = current_admin
  	else
  		redirect_to root_path
  	end
  end
end
