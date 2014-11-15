require 'rails_helper'

	describe AdminController do
		describe 'main page test' do
			it 'should render the main page' do
				get :main
				response.should render_template('main')
			end
		end

		describe 'admin actions on user' do
			it 'should delete users' do 
				user_id = 1
				mock_user = double('user1')
				User.should_receive(:find_by_id).and_return(mock_user)
				mock_user.should_receive(:destroy)
				post :delete_user
				response.should redirect_to :action=>:main
			end


			it 'should approve users' do
				mock_papp_id = double('status1')
				mock_act_id = double('status2')
				Status.should_receive(:where).with({:code=>"PAPP"}).and_return(mock_papp_id)
				mock_papp_id.should_receive(:first).and_return(mock_papp_id)
				Status.should_receive(:where).with({:code=>"ACTIVE"}).and_return(mock_act_id)
				mock_act_id.should_receive(:first).and_return(mock_act_id)
				mock_papp_id.should_receive(:id).and_return(1)
				mock_act_id.should_receive(:id).and_return(2)
				User.should_receive(:update_status).with(1,2)
				post :approve_all
				response.should redirect_to :action=>:main
			end

			it 'should resend activation to users' 

			it 'should disable users' do
				mock_user = double('user1')
				User.should_receive(:find_by_id).and_return(mock_user)
				mock_status = double('status1')
				mock_status2 = double('status2')
				mock_user.should_receive(:status_id).and_return(1)
				Status.should_receive(:find_by_id).with(1).and_return(mock_status)
				mock_status.should_receive(:code).and_return('DISABLE')
				Status.should_receive(:where).with({:code=>'ACTIVE'}).and_return(mock_status2)
				mock_status2.should_receive(:first).and_return(mock_status2)
				mock_status2.should_receive(:id).and_return(1)
				mock_user.should_receive(:status_id=).with(1)
				mock_user.should_receive(:save)
				post :disable_user
				response.should redirect_to :action=>:main
			end

			it 'should add users' do
				mock_email = double('email1')
				User.should_receive(:add_user)
				post :add_users
				response.should redirect_to :action=>:main
			end

		end
	end
