class Pkeyword < ActiveRecord::Base
  attr_accessible :user_id, :keyword_id
  #has_one :profile -- psakuru:wouldn't make sense as we dont have profile_id as a foreign key here 
  #Replacing with belongs_to :user
  belongs_to :user
  belongs_to :keyword
  validates :user_id, presence: true
  validates :keyword_id , presence: true
end
