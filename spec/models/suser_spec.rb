require 'rails_helper'
describe Suser do
	describe 'suser model methods' do
		it 'should insert suser' do
			SecureRandom.should_receive(:hex).with(25).and_return('123456789012hlgjvhljvjkljkjvgu')
			Suser.insert_suser('foo@abc.com') == '1234567890'
		end
	end
end
