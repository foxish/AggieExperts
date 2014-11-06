class User < ActiveRecord::Base
  attr_accessible :email, :password, :activation_date, :status_id
end
