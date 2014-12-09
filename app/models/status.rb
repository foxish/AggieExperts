class Status < ActiveRecord::Base
  attr_accessible :code, :description, :entity
  has_many :users
  has_many :susers
  validates :code, presence: true
  validates :code, uniqueness: true
end
