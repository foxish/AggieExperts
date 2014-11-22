class Urole < ActiveRecord::Base
   attr_accessible :code, :description
   has_many :user
   validates :code, presence: true
   validates :code, uniqueness: true
end
