class Login < ActiveRecord::Base  
  attr_accessible :name, :description
  def return_text
    return "foo"
  end
end
