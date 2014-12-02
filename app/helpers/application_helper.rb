module ApplicationHelper
	def admin_path 
		'/admin/main'
	end
	
	def trim_email(email)
		/^([^@]*)@([^.]*).(.*)$/i =~ email
		return $1
	end

  def admin_role
    Urole.find_by_code("ADMIN").id
  end

  def user_role
    Urole.find_by_code("USER").id
  end
end
