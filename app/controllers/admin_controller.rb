class AdminController < ApplicationController
	helper AdminHelper
	def main
		@users = User.all
	end

	def approve_all
		fromStatus = Status.where(code: 'PAPP').first
		toStatus = Status.where(code: 'ACTIVE').first
		User.update_status(fromStatus.id,toStatus.id)
		redirect_to ("/admin/main")
	end

	def add_users
		email = params[:userEmail]
		User.add_user(email)
		redirect_to("/admin/main")
	end

	def method_missing(*arg)
		redirect_to("/")
	end
end
