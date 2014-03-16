require 'spec_helper'

describe SessionsController do
  let!(:user) { create :user }
  let!(:session) {{'rack-session' => {:id => user.id}}}

  context "#create" do
    it "creates session id with valid attr" do
      post :create, {:users => { email: user.email, password: user.password}}
      expect(request.session[:id]).to be user.id
      response.should redirect_to "/questions"
    end

    it "does not create session id with invalid attr" do
      post :create, {:users => { email: user.email, password: "1"}}
      expect(request.session[:id]).to be nil
      response.should redirect_to "/users"
    end
  end

  context '#destroy' do
    it 'destroys session id when logging out' do
      request.env['HTTP_REFERER'] = 'http://localhost'
      delete :destroy, {:id => user.id}, session
      expect(request.session[:id]).to be nil
    end
  end
end

