class Pkeyword < ActiveRecord::Base
  belongs_to 
  attr_accessible :user_id, :keyword_id
end
