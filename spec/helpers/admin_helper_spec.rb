require 'rails_helper'
	describe AdminHelper, :type => :helper do
      fixtures :status
  		describe 'Admin helper methods' do
  			it 'should tell us if delete should be enabled or not' do
  				statusId = 1
  				expect(delete_enabled(statusId)).to eq(true)
  			end
  			it 'should give us the status description' do
  				statusId = 1
  				mock_status = double('status1')
  				mock_desc = double('desc')
  				Status.should_receive(:find_by_id).with(1).and_return(mock_status)
  				mock_status.should_receive(:description).and_return(mock_desc)
  				expect(status_description(statusId)).to eq(mock_desc)
  			end
  			it 'should tell us if resend should be enabled or not' do
  				statusId = 1
  				expect(resend_enabled(statusId)).to eq(true)
  			end

  			it 'should tell us if approve should be enabled or not' do
  				statusId = 1
  				expect(approve_enabled(statusId)).to eq(false)
  			end

  			it 'should tell us if approve should be enabled or not' do
  				statusId = status(:status1).id
  				expect(disable_enabled(statusId)).to eq(0)
  				statusId = status(:status3).id
  				expect(disable_enabled(statusId)).to eq(0)
  				statusId = status(:status2).id
  				expect(disable_enabled(statusId)).to eq(2)
  				statusId = status(:status4).id
  				expect(disable_enabled(statusId)).to eq(1)
  			end
  		end
  	end
