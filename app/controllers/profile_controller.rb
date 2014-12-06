class ProfileController < ApplicationController
  def show
    @profile = Profile.where(:user_id => params[:id]).first
    if @profile.nil?
      Profile.create(:user_id => params[:id])
      redirect_to edit_profile_path(params[:id])
    else
      @user = params[:id]
      @publications = Ppublication.where(:user_id => params[:id])
      @keywords = Keyword.get_for_user(params[:id])
      unless @profile[:phone].nil?
        @phone_num = Profile.format_phone(@profile[:phone])
      end
    end
  end

  def edit
    @user = params[:id]
    
    @publications = Ppublication.where(:user_id => params[:id])
    @profile = Profile.where(:user_id => params[:id]).first
    @keywords = Keyword.get_for_user(params[:id])
  end

  def update
    profile = Profile.where(:user_id => params[:id]).first
    Ppublication.update({:id => params[:id], :data => params['pub']})

    Pkeyword.update({:id => params[:id], :data => params['keyword']})

    profile.update_attributes(params['user'])
    flash[:notice] = " Profile was successfully updated!"
    redirect_to profile_path(params[:id])

  end

  def request_invite
    render template: ("users/invite")
  end

  def invite_suser
    Suser.create!(:name=> params[:suser][:name], :department=>params[:suser][:department], :email=>params[:suser][:email], :status_id => Status.find_by_code('REQ').id, :message => params[:suser][:message])
    redirect_to root_path
  end
end
