class Profile < ActiveRecord::Base
  attr_accessible :user_id, :fname, :lname, :description, :phone, :email
end
