class AdminController < ApplicationController
	helper AdminHelper
	def main
		if !current_user.nil? && (current_user.urole_id == User.get_admin_role)
			@status = Status.where(entity: 'USER')
			urole = Urole.find_by_code('USER')
			@users = User.find_reg_users(current_user['id'])
			@pact_susers = Status.find_by_code('PACT').susers
			@invite_susers = Status.find_by_code('REQ').susers
			@suser_status = Status.find_by_code('PACT')
			@inv_status = Status.find_by_code('REQ')
		else
			redirect_to ("/")
		end
	end

	def make_admin
		user = User.find_by_id(params[:make_admin_user])
		if Urole.find_by_id(user.urole_id).code.eql?'USER' then
			user.urole_id = Urole.find_by_code('ADMIN').id
			user.id = user['id']
			user.save(:validate => false)
		else
			flash[:notice] = "Cannot make user admin. Illegal state!!"
		end
		redirect_to ("/admin/main")
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
			Suser.insert_suser(email,request.host_with_port)
		else
			flash[:notice] = "User already exists in the system"
		end
		redirect_to("/admin/main")
	end

	def method_missing(*arg)
		redirect_to("/")
	end

	def delete_user
		User.destroy(params[:delete_user])
		Clearance.configuration.user_model.delete(params[:delete_user])
		redirect_to("/admin/main")
	end

	def delete_suser
		user = Suser.find_by_id(params[:delete_suser])
		user.destroy
		redirect_to("/admin/main")
	end

	def delete_inv_suser
		user = Suser.find_by_id(params[:delete_inv_suser])
		user.destroy
		redirect_to("/admin/main")
	end

	def disable_user
        user = User.find_user(params[:disable_user])
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
        user.id = user['id']
		user.save(:validate => false)
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
        user.id = user['id']
		user.save(:validate => false)
		redirect_to("/admin/main")
	end

	def resend_activation
		resend_user = Suser.find_by_id(params[:resend_suser])
		resend_user.re_send_act(request.host_with_port)
		redirect_to("/admin/main")
	end
    
	def approve_suser
		suser = Suser.find_by_id(params[:approve_suser])
		email = suser.email
		if User.find_by_email(email).nil?
			suser.re_send_act(request.host_with_port)
		else
			flash[:notice] = "User already exists in the system"
			suser.destroy!
		end
		redirect_to("/admin/main")
	end
end
