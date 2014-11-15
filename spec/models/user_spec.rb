require 'rails_helper'
describe User do
	fixtures :users
  	describe 'user model methods' do
  		it 'should update status' do
  			User.update_status(3,4).should == [users(:user3)]
  		end

  		it 'should add new user' do
  			User.add_user('foo4@abc.com').should == User.find_by_email('foo4@abc.com')
  		end
 	 end
end
