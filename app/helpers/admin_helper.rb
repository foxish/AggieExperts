module AdminHelper
	def status_description(statusId)
		s = Status.find_by_id(statusId)
		s.description
	end
end
