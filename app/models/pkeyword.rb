class Pkeyword < ActiveRecord::Base
  attr_accessible :user_id, :keyword_id
  has_one :profile
  

end
