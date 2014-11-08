class User < ActiveRecord::Base
  attr_accessible :email, :password, :activation_date, :status_id
  belongs_to :status
  validates :email, presence: true,uniqueness: {:message => "email already exist"}
  

  def self.update_status(fromStatusId,toStatusId)
  	users = User.where(status_id: fromStatusId)
  	users.each do |user|
  		user.update_attributes(:status_id => toStatusId)
  		user.save
  	end
  end

  def self.add_user(email)
  	tempPass = Suser.insert_suser(email)
  	#new user always starts with status code 'PACT'
  	statusId = Status.where(code: 'PACT').first
  	User.create!(:email  => email,:password => tempPass, :status_id => statusId.id)
  end
end
