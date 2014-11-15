class UserController < ApplicationController
  def show
    user = params[:id]
    @publications = Ppublication.where(:user_id => user)
    @profile = Profile.where(:user_id => user).first
    @keywords = Profile.keywords_as_string(user)
  end

  def edit
    user = params[:id]
    @publications = Ppublication.where(:user_id => user)
    @profile = Profile.where(:user_id => user).first
    @keywords = Profile.keywords(user)
  end

  def update
    profile = Profile.where(:user_id => params[:id]).first
    publications = Ppublication.where(:user_id => params[:id])

    publications.each do |pub|
      if ((params['pub'][pub.id.to_s]).key?("check"))
        pub.destroy
      else
        pub.update_attributes!((params['pub'][pub.id.to_s])['data'])
      end
    end

    if profile.update_attributes(params['user'])
      flash[:notice] = " Profile was successfully updated!"
      redirect_to user_path(profile)
    else
      render edit_path(profile)
    end

  end
end
