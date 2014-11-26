class AdminController < ApplicationController
	helper AdminHelper
	def main
		@status = Status.all
		urole = Urole.find_by_code('USER')
		@users = urole.users
		@susers = Suser.all
		@suser_status = Status.find_by_code('PACT')
	end

	def approve_all
		fromStatus = Status.where(code: 'PAPP').first
		toStatus = Status.where(code: 'ACTIVE').first
		User.update_status(fromStatus.id,toStatus.id)
		redirect_to ("/admin/main")
	end

	def add_users
		email = params[:userEmail]
		if User.find_by_email(email).nil? && Suser.find_by_email(email).nil?
			Suser.insert_suser(email)
		else
			flash[:notice] = "User already exists in the system"
		end
		redirect_to("/admin/main")
	end

	def method_missing(*arg)
		redirect_to("/")
	end

	def delete_user
		user = User.find_by_id(params[:delete_user])
		user.destroy
		redirect_to("/admin/main")
	end

	def delete_suser
		user = Suser.find_by_id(params[:delete_suser])
		user.destroy
		redirect_to("/admin/main")
	end

	def disable_user
		user = User.find_by_id(params[:disable_user])
		from_status = Status.find_by_id(user.status_id)
		if from_status.code.eql?'DISABLE' then
			to_status = Status.where(code: 'ACTIVE').first
			user.status_id = to_status.id
		elsif from_status.code.eql?'ACTIVE' then
			to_status = Status.where(code: 'DISABLE').first
			user.status_id = to_status.id
		else
			flash[:notice] = "Cannot enable or disable user. Illegal state!!"
		end
		user.save
		redirect_to("/admin/main")
	end

	def approve_user
		user = User.find_by_id(params[:approve_user])
		status = Status.find_by_id(user.status_id)
		if status.code.eql?'PAPP' then
			user.status_id = Status.where(code: 'ACTIVE').first.id
		else
			flash[:notice] = "Cannot approve user. Not a valid user state to approve!!"
		end
		user.save
		redirect_to("/admin/main")
	end

	def resend_activation
		user = User.find_by_id(params[:resend_act_suser])
		user.re_send_act
	end
end
