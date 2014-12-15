require 'rails_helper'
describe StaticController do
  describe 'Home Page tests' do
    it 'should render the index page' do
        get :index
        response.should render_template('index')
    end
    it 'should load the login view' do
        get :contact_us
        response.should render_template('contact_us')
    end
  end
end
