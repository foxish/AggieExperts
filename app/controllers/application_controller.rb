class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :admin_path
  	def admin_path 
		flash[:alert] = "You have successfully navigated to admin page."
		'/admin/main'
	end
end
