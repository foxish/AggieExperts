class Ppic < ActiveRecord::Base
   attr_accessible :pic, :user_id
   belongs_to :user
   validates :pic, presence: true
end
