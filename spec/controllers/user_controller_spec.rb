require 'rails_helper'

describe UserController do
  describe 'Checking profile page' do
    it 'should render show template' do
        get :show, {'id' => '1'}
        response.should render_template('show')
    end
    # it 'should read the term parameter from GET' do
    #     user_id = '1'
    #     get :user, {'id' => user_id}
    #     assigns(:id).should == user_id
    #     response.should render_template('show')
    # end
    # it 'should call the method to find matching profiles in the Profile model' do
    #     search_term = 'Antiquity'
    #     mocked_profile = double('profile1')
    #     mocked_profile.should_receive(:user_id).twice.and_return(1)


    #     fake_results = [mocked_profile]
    #     Profile.should_receive(:get_profiles_by_keyword).with(search_term).and_return(fake_results)
    #     get :search, {'term' => search_term}
    # end
  end
end
