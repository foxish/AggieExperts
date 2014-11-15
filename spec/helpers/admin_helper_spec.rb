require 'rails_helper'
include AdminHelper
	describe AdminHelper, :type => :helper do
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
  				statusId = Status.find_by_code(:PACT)
  				expect(resend_enabled(statusId)).to eq(true)
  			end

  			it 'should tell us if approve should be enabled or not' do
  				statusId = Status.find_by_code(:PACT)
  				expect(approve_enabled(statusId)).to eq(false)
  			end

  			it 'should tell us if approve should be enabled or not' do
  				statusId = Status.find_by_code(:PACT)
  				expect(disable_enabled(statusId)).to eq(0)
  				statusId = Status.find_by_code(:PAPP)
  				expect(disable_enabled(statusId)).to eq(0)
  				statusId = Status.find_by_code(:DISABLE)
  				expect(disable_enabled(statusId)).to eq(2)
  				statusId = Status.find_by_code(:ACTIVE)
  				expect(disable_enabled(statusId)).to eq(1)
  			end
  		end
  	end
