class User < ActiveRecord::Base
  attr_accessible :email, :password, :status_id, :urole_id
  has_many :pkeywords
  has_one :profile
  has_many :ppublications
  has_one :ppic
  belongs_to :urole
  belongs_to :status
  validates :email, presence: true,uniqueness: {:message => "email already exists"}
  validates :urole_id, presence: true

  def self.update_status(fromStatusId, toStatusId)
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
  	User.create!(:email  => email, :status_id => statusId.id)
  end
end
