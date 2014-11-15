class Status < ActiveRecord::Base
  attr_accessible :code, :description
  validates :code, presence: true
  validates :code, uniqueness: true
end
