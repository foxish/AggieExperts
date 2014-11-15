require 'rails_helper'
describe Profile do
  fixtures :profiles
  describe 'get_profiles_by_keyword' do
      it 'should get all profiles which list a particular keyword' do
        Profile.get_profiles_by_keyword("foo").should == [profiles(:user2), profiles(:user1)]
      end
      
      it 'should correctly return single matches' do
        Profile.get_profiles_by_keyword("bar").should == [profiles(:user1)]
      end
      
      it 'should correctly return empty matches' do
        Profile.get_profiles_by_keyword("quux").should == []
      end
  end
end
