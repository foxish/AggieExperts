require 'rails_helper'
 
describe LoginController do
  describe 'Checking page' do
    it 'should call the login controller' do
        get :index
        response.should render_template('index')
    end
    it 'should load the login view' do
    
    end
    it 'should make a single parameter X available to that view'
  end
end
