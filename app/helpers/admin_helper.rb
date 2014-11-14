module AdminHelper
	def status_description(statusId)
		s=Status.find_by_id(statusId)
		s.description
	end

	def delete_enabled(statusId)
		return true
	end

	def resend_enabled(statusId)
		s=get_status_code(statusId)
		if s.eql?'PACT' then
			return true
		else
			return false
		end
	end

	def approve_enabled(statusId)
		s=get_status_code(statusId)
		if s.eql?'PAPP' then
			return true
		else
			return false
		end
	end

	def disable_enabled(statusId)
		s=get_status_code(statusId)
		if s.eql?'DISABLE' then
			return 2
		elsif (s.eql?'PACT' or s.eql?'PAPP') 
			return 0
		elsif s.eql?'ACTIVE'
			return 1
		end
	end

	def get_status_code(statusId)
		s=Status.find_by_id(statusId)
		s.code
	end


end
