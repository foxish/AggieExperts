require 'rails_helper'
require 'spec_helper'

describe ProfileController do
  fixtures :susers, :status
  before(:all) do
    setup_controller_request_and_response
    @user = FactoryGirl.create(Clearance.configuration.user_model.to_s.underscore.to_sym)
    @user['id'] = @user.id
    sign_in_as @user
  end

  describe 'Checking show controller' do
    it 'should call correct model methods and render correct page' do
      controller.stub(:current_user).and_return(@user)
      mock_code = double('status1')
      
      Profile.should_receive(:where).with(:user_id => "1").and_return([{:phone => '1234567890', :name=> "foo1"}, {:phone => '1234567890', :name=> "foo2"}])

      User.should_receive(:get_admin_role).and_return(1)
      
      Ppublication.should_receive(:where).with(:user_id => "1").and_return("bar")
      Keyword.should_receive(:get_for_user).with("1").and_return("baz")

      get :show, {'id' => '1'}
      assigns(:user).should == '1'
      assigns(:profile).should == {"phone" => '1234567890', "name"=> "foo1"}
      assigns(:publications).should == 'bar'
      assigns(:keywords).should == 'baz'

      response.should render_template('show')
    end
  end

  describe 'Checking edit controller' do
    it 'should call correct model methods and render correct page' do
      controller.stub(:current_user).and_return(@user)
      mocked_profile = double('profile1')

      Profile.should_receive(:where).with(:user_id => @user.id.to_s).and_return([mocked_profile])
      Ppublication.should_receive(:where).with(:user_id => @user.id.to_s).and_return("bar")
      Keyword.should_receive(:get_for_user).with(@user.id.to_s).and_return("baz")

      get :edit, {'id' => @user.id}
      assigns(:user).should == @user.id.to_s
      assigns(:profile).should == mocked_profile
      assigns(:publications).should == 'bar'
      assigns(:keywords).should == 'baz'

      response.should render_template('edit')
    end
  end

  describe 'Checking update controller' do
    it 'should call correct model methods and render correct page' do
      mocked_profile = double('profile1')
      mocked_profile.should_receive(:update_attributes).with({'user' => 'user'}).and_return(true)
      mocked_profile.should_receive(:errors).and_return({:error => ''})
      Profile.should_receive(:where).with(:user_id => "1").and_return([mocked_profile, "foo2"])

      Ppublication.should_receive(:update).with({:id => "1", :data => 'foo'}).and_return('')
      Pkeyword.should_receive(:update).with({:id => "1", :data => 'bar'})

      put :update, {:id => "1", :user => {'user' => 'user'}, :pub => 'foo', :keyword => 'bar'}
    end
  end

end
