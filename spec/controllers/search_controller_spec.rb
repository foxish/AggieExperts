require 'rails_helper'
 
describe SearchController do
  describe 'checking search controller actions' do
    it 'should call the search controller' do
        get :search
        response.should render_template('search')
    end
    
    it 'should read the term parameter from GET' do
        search_term = 'Antiquity'
        get :search, {'term' => search_term}
        assigns(:term).should == search_term
        response.should render_template('search')
    end
    
    it 'should call the method to find matching profiles in the Profile model' do
        search_term = 'Antiquity'
        mocked_profile = double('profile1')
        mocked_profile.should_receive(:user_id).twice.and_return(1)
        
        fake_results = [mocked_profile]
        Profile.should_receive(:get_profiles_by_keyword).with(search_term).and_return(fake_results)
        
        get :search, {'term' => search_term}
        assigns(:profiles).should == [mocked_profile]
    end
    
    it 'should return all keywords for returned profiles' do
        search_term = 'Antiquity'
        mocked_profile = double('profile1')
        mocked_keyword = double('keyword1')
        mocked_profile.should_receive(:user_id).twice.and_return(1)
        
        fake_results = [mocked_profile]
        Profile.should_receive(:get_profiles_by_keyword).with(search_term).and_return(fake_results)
        Keyword.should_receive(:get_for_user).and_return(mocked_keyword)
        
        get :search, {'term' => search_term}
        assigns(:keywords).should == {1 => mocked_keyword}
    end

  end
end
