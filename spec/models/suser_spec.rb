require 'rails_helper'
describe Suser do
	describe 'suser model methods' do
		it 'should insert suser' do
			mock_suser = double('suser1')
            
            SecureRandom.should_receive(:hex).with(50).and_return('123456789012hlgjvhljvjkljkjvgu')
            Suser.should_receive(:create!).and_return(mock_suser)
            mock_suser.should_receive(:sendActivationLink).with('')
            Suser.insert_suser('foo@abc.com', '') == '123456789012hlgjvhljvjkljkjvgu'
		end
	end
end
