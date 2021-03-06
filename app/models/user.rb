class User < ActiveRecord::Base
include Clearance::User
  attr_accessible :email, :password, :status_id, :urole_id, :encrypted_password
  attr_accessor :id
  has_many :pkeywords, :dependent => :destroy
  has_one :profile, :dependent => :destroy
  has_many :ppublications, :dependent => :destroy
  belongs_to :urole
  belongs_to :status
  validates :urole_id, presence: true
  validates :email, presence: true, uniqueness: {:message => "email already exists"}, format: { with: /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/,
    message: "Email is not of the correct format" }

  def self.update_status(fromStatusId, toStatusId)
  	users = User.where(status_id: fromStatusId)
  	users.each do |user|
  		user.update_attributes(:status_id => toStatusId)
        user.id = user['id']
  		user.save(:validate => false)
  	end
  end

  def self.update_role(fromRoleId,toRoleId)

  end
  
  def self.find_user(user_id)
    return User.where(id: user_id).first
  end

  def self.add_user(email)
  	tempPass = Suser.insert_suser(email)
  	#new user always starts with status code 'PACT'
  	statusId = Status.where(code: 'PACT').first
    uroleId = Urole.find_by_code('USER')
  	User.create!(:email  => email, :status_id => statusId.id, :urole_id => uroleId.id)
  end
  
  def self.get_admin_role()
    Urole.find_by_code('ADMIN').id
  end
  
  def self.get_user_role()
    Urole.find_by_code('USER').id
  end
  
  def get_role()
    self.urole_id
  end
  
  def change_password(new_pwd)
    update_password new_pwd
    @id = self['id']
    save!(:validate => false)
  end

  def self.find_reg_users(id)
    users = User.where("status_id is not null and id <> ?",id)
  end
end
