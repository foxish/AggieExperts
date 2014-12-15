require 'rails_helper'
describe User do
	fixtures :users
  	describe 'user model methods' do
  		it 'should update status' do
            User.should_receive(:where).and_return([users(:user1), users(:user2)])
            User.update_status(4,3)
            
            users(:user1).status_id.should == 3
            users(:user2).status_id.should == 3
  		end
 	 end
end
