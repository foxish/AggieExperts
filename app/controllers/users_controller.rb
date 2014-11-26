class UsersController < Clearance::UsersController
skip_before_filter :authorize, only: [:create, :new]
  before_filter :avoid_sign_in, only: [:create, :new], if: :signed_in?

  def new
    session[:id] = nil
    @user = user_from_params
    if session[:id].nil?
      redirect_to ("/")
    else
      render template: 'users/new'
    end
  end

  def create
    passcheck = validatePassword();
    @user = user_from_params
      if !passcheck
        flash[:notice] = "Passwords do not match!!"
        render template: 'users/new'
      else
        if @user.save
          Suser.find_by_id(session[:id]).delete
          session[:id]=@user.id
          session[:role]=@user.role_id
          sign_in @user
          redirect_back_or url_after_create
        end
      end
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
    user_params.delete(:re_password)
    if !(params[:aid].nil?) && !(Suser.find_by_activation_link(params[:aid]).nil?)
      session[:id] = Suser.find_by_activation_link(params[:aid]).id
    end
    Clearance.configuration.user_model.new(user_params).tap do |user|
      if session[:id].nil?
        user.email = email
      else
        user.email = Suser.find_by_id(session[:id]).email
      end
      user.password = password
      user.urole_id = User.get_user_role
      user.status_id = Status.find_by_code('PAPP').id
    end
  end

  def user_params
    params[:user] || Hash.new
  end

  def validatePassword()
    if user_params[:password] != user_params[:re_password]
      return false
    else
      return true
    end
  end
end
