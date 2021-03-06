class ProfileController < ApplicationController

  def show
    @profile = Profile.where(:user_id => params[:id]).first
    if @profile.nil?
      redirect_to new_profile_path(params[:id])
    else
      if !current_user.nil? && (current_user.urole_id == User.get_admin_role || current_user['id'].to_s == params[:id]) ||
          !(Status.find_by_id(User.find_by_id(params[:id]).status_id).code == 'DISABLE')
        @user = params[:id]
        @publications = Ppublication.where(:user_id => params[:id])
        @keywords = Keyword.get_for_user(params[:id])
        unless @profile[:phone].nil?
          @phone_num = Profile.format_phone(@profile[:phone])
        end
      else
        flash[:notice] = "You do not have permission to do that"
        redirect_to '/'
      end
    end
  end

  def new
    if !current_user.nil? && current_user['id'].to_s == params[:format]
      @profile = Profile.new
      @profile.user_id = params[:format]
      @profile.save(:validate => false)
      redirect_to edit_profile_path(params[:format])
    else
      flash[:notice] = !current_user.nil? && current_user.urole_id == User.get_admin_role ?
          "Profile has not yet been created" :
          "You do not have permission to do that"
      redirect_to '/'
    end
  end

  def edit
    @user = params[:id]
    @profile = Profile.where(:user_id => params[:id]).first
    if(@profile.nil?)
      redirect_to new_profile_path(params[:id])
    elsif !current_user.nil? && current_user['id'].to_s == @user
      @publications = Ppublication.where(:user_id => params[:id])
      @keywords = Keyword.get_for_user(params[:id])
    else
      flash[:notice] = !current_user.nil? && current_user.urole_id == User.get_admin_role ?
          "Profile has not yet been created" :
          "You do not have permission to do that"
      redirect_to '/'
    end
  end

  def update
    message = "Profile was successfully saved!"
    if Status.find_by_id(User.find_by_id(params[:id]).status_id).code == 'PAPP' ||
        Status.find_by_id(User.find_by_id(params[:id]).status_id).code == 'DISABLE'
      message = message + " The profile will be visible after admin approval"
    end
    profile = Profile.where(:user_id => params[:id]).first


    if params['user'].key?('picture_check') && params['user']['picture_check']
      profile.remove_pic
    end
    params['user'].delete('picture_check')

    profile.update_attributes(params['user'])

    error_message = profile.errors.values.join(' + ')
    model_error = Ppublication.update({:id => params[:id], :data => params['pub']})
    error_message = error_message == '' ? model_error : model_error =='' ? error_message: error_message + ' + ' + model_error

    model_error = Pkeyword.update({:id => params[:id], :data => params['keyword']})
    error_message = error_message == '' ? model_error : model_error =='' ? error_message: error_message + ' + ' + model_error

    flash[:notice] = error_message == '' ? message : error_message
    redirect_to profile_path(params[:id])

  end

  def request_invite
    render template: ("users/invite")
  end

  def invite_suser    
    email = params[:suser][:email]
    if User.find_by_email(email).nil? && Suser.find_by_email(email).nil?
      Suser.create(:name=> params[:suser][:name], :department=>params[:suser][:department], :email=>params[:suser][:email], :status_id => Status.find_by_code('REQ').id, :message => params[:suser][:message])
      flash[:notice] = "Thank you. An email will be sent to you once your request is approved"
    else
      flash[:notice] = "Sorry. The email already exists in the system. Use 'Forgot Password' to set a new password"
    end
    redirect_to root_path
  end
end
