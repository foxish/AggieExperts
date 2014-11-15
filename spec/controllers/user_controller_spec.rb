require 'rails_helper'

describe UserController do
  describe 'Checking profile page' do
    it 'should render show template' do
      get :show, {'id' => '1'}
      response.should render_template('show')
    end
  end
end