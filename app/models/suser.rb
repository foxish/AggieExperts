require 'securerandom'

class Suser < ActiveRecord::Base
   attr_accessible :email, :activation_link, :active_till
   validates :email, presence: true,uniqueness: {:message => "already exist"}
   validates :activation_link, uniqueness: true

   def self.insert_suser(email)
   	random_token = SecureRandom.hex(25)
   	Suser.create!(:email => email,:activation_link => random_token, :active_till => Time.now+10.days)
   	random_token[10]
   end

end
