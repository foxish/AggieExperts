module AdminHelper
	def status_description(statusId)
		s=Status.find_by_id(statusId)
		s.description
	end

	def getUserName(userId)
		user = User.find_by_id(userId)
		if user.profile.nil? || user.profile.name.nil? || user.profile.name.gsub(/\s+/, "").nil?
			return trim_email(user.email)
		else
			return user.profile.name
		end
	end

	def delete_enabled(statusId)
		return true
	end

	def resend_enabled(statusId)
		s=Status.find_by_id(statusId).code
		if s.eql?'PACT' then
			return true
		else
			return false
		end
	end

	def approve_enabled(statusId)
		s=Status.find_by_id(statusId).code
		if s.eql?'PAPP' then
			return true
		else
			return false
		end
	end

	def disable_enabled(statusId)
		s=Status.find_by_id(statusId).code
		if s.eql?'DISABLE' then
			return 2
		elsif (s.eql?'PACT' or s.eql?'PAPP') 
			return 0
		elsif s.eql?'ACTIVE'
			return 1
		end
	end

	def getSuserName(userId)
		suser = Suser.find_by_id(userId)
		if suser.name.nil? || suser.name.nil? || suser.name.gsub(/\s+/, "").nil?
			return trim_email(suser.email)
		else
			return suser.name
		end
	end

end
