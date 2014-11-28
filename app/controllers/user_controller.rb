class UserController < ApplicationController
  def show
    @user = params[:id]
    @publications = Ppublication.where(:user_id => params[:id])
    @profile = Profile.where(:user_id => params[:id]).first
    @keywords = Keyword.get_for_user(params[:id])

    @phone_num = Profile.format_phone(@profile[:phone])
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
    redirect_to user_path(params[:id])

  end
end
