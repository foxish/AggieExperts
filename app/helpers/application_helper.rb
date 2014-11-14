module ApplicationHelper
	def admin_path 
		flash[:alert] = "You have successfully navigated to admin page."
		'/admin/main'
	end
	
	def trim_email(email)
		/^([^@]*)@([^.]*).(.*)$/i =~ email
		return $1
	end
end
