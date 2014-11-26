require 'debugger'
class UsersController < Clearance::UsersController
skip_before_filter :authorize, only: [:create, :new]
  before_filter :avoid_sign_in, only: [:create, :new], if: :signed_in?

  def new
    @user = user_from_params
    render template: 'users/new'
  end

  def create
    @user = user_from_params
    if params[:password] != params[:re_password]
      flash[:notice] = "Passwords do not match"
    else
      debugger
      if @user.save
        sign_in @user
        redirect_back_or url_after_create
      end
    end
    redirect_to "/sign_up"
  end

  private

  def avoid_sign_in
    redirect_to Clearance.configuration.redirect_url
  end

  def url_after_create
    Clearance.configuration.redirect_url
  end

  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    
    
    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = 'sp.prithvi@gmail.com'
      user.password = password
      user.urole_id = User.get_user_role
      user.status_id = Status.find_by_code('PAPP').id
    end
  end

  def user_params
    params[:user] || Hash.new
  end
end
