class SessionsController < Clearance::SessionsController
  skip_before_filter :authorize, only: [:create, :new, :destroy]
  protect_from_forgery except: :create

  def create
    @user = authenticate(params)
    sign_in(@user) do |status|
      if status.success?
        redirect_back_or url_after_create
      else
        flash.notice = status.failure_message
        redirect_to request.referer
      end
    end
  end
  
  def destroy
    sign_out
    redirect_to url_after_destroy
  end
  
  private

  def url_after_create
    Clearance.configuration.redirect_url
  end

  def url_after_destroy
    root_url
  end
end
