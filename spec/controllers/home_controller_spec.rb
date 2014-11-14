require 'rails_helper'
describe HomeController do
  describe 'Home Page tests' do
    it 'should render the index page' do
        get :index
        response.should render_template('index')
    end
    it 'should load the login view'
  end
end
