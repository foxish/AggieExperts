require 'rails_helper'
	describe AdminController do 
        fixtures :susers, :status
        before(:all) do
          setup_controller_request_and_response
          @user = FactoryGirl.create(Clearance.configuration.user_model.to_s.underscore.to_sym)
          @user['id'] = @user.id
          sign_in_as @user
        end
        
        describe 'main page test' do
			it 'should render the main page' do
                mock_user = double('user1')
                mock_code = double('status1')
                mock_suser = double('suser1')
                
                controller.stub(:current_user).and_return(@user)
                User.should_receive(:get_admin_role).and_return(1)
                Urole.should_receive(:find_by_code).with('USER').and_return(2)
                User.should_receive(:find_reg_users).with(@user.id).and_return(mock_user)
                Status.should_receive(:find_by_code).exactly(4).and_return(mock_code)
                mock_code.should_receive(:susers).twice.and_return([mock_suser])
                
                get :main
                response.should render_template('main')
			end
		end

		describe 'admin actions on user' do
			it 'should delete users' do 
				user_id = '1'
                User.should_receive(:destroy).with(user_id)
				post :delete_user, { delete_user: user_id }
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
                mock_status = double('status1')
				mock_status2 = double('status2')
				
                User.should_receive(:find_user).and_return(mock_user)
				Status.should_receive(:find_by_id).with(1).and_return(mock_status)
				Status.should_receive(:where).with({:code=>'ACTIVE'}).and_return(mock_status2)
                mock_status.should_receive(:code).and_return('DISABLE')
                mock_status2.should_receive(:first).and_return(mock_status2)
				mock_status2.should_receive(:id).and_return(1)
                mock_user.should_receive(:[])
                mock_user.should_receive(:id=)
				mock_user.should_receive(:status_id=).with(1)
				mock_user.should_receive(:save)
				mock_user.should_receive(:status_id).and_return(1)
                post :disable_user
                response.should redirect_to :action=>:main
			end

			it 'should add users' do
				mock_email = double('email1')
                mock_user = double('user1')
                mock_suser = double('suser1')
                
                Suser.should_receive(:insert_suser)                
				post :add_users
				response.should redirect_to :action=>:main
			end

		end
	end
