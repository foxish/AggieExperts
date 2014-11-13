class Profile < ActiveRecord::Base
  has_many :pkeywords
  attr_accessible :user_id, :fname, :lname, :description, :phone, :email
end
