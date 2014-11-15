require 'rails_helper'
describe Keyword do
  fixtures :keywords, :pkeywords
  describe 'test db getter functions' do
    it 'should get the best match for a given keyword' do
      Keyword.get_match("foo").should == keywords(:foo)
    end
    
    it 'should get the keywords associated with a specific user' do
        Keyword.get_for_user(1).should == [keywords(:bar), keywords(:foo)]
    end
  end
end
