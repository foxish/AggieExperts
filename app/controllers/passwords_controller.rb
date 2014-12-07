class PasswordsController < Clearance::PasswordsController
  skip_before_filter :authorize, only: [:reset_password]
  before_filter :forbid_non_existent_user, only: [:edit, :update]
end
