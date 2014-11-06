module ApplicationHelper
	def admin_path 
		flash[:alert] = "You have successfully navigated to admin page."
		'/admin/main'
	end
end
