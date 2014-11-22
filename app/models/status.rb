class Status < ActiveRecord::Base
  attr_accessible :code, :description
  has_many :users
  validates :code, presence: true
  validates :code, uniqueness: true
end
