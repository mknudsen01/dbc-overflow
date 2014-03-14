require 'spec_helper'

describe UsersController do
  let!(:user) { User.create(username: 'test',
                            email: 'test@test.com',
                            password: 'testing',
                            password_confirmation: 'testing')}
  context "#index" do
    it "is sucessful" do
      get :index
      expect(response).to be_success
    end

    it 'redirects if logged_in' do
      session[:id] = user.id
      get :index
      expect(response).to be_redirect
    end

   context '#create' do
    it "creates with valid attributes" do
      expect {
        post :create, :user => {username: 'test1',
                            email: 'test@test1.com',
                            password: 'testing1',
                            password_confirmation: 'testing1'}
      }.to change { User.count }.by(1)
      response.should redirect_to '/'
    end

    it "doesn't create if attributes are invalid" do
      expect {
        post :create, :user => {}
      }.to_not change { User.count }.by(1)
    response.should redirect_to '/users/new'
    end

  end

    context '#show' do
      it 'sets @user to current user' do
        session[:id] = user.id
        get :show, :id => user.id
        expect(assigns(:user)).to eq(User.find(session[:id]))
      end
     end

   context '#new' do
    it 'sets @user to new instance of User' do
      get :new
      expect(assigns(:user)).to be_a_new User
    end
   end

end

  #   it "assigns @answers to Answer.all" do
  #     get :index
  #     expect(assigns(:answers)).to eq(Answer.all)
  #   end
  # end

  # context "#show" do
  # end

  # context "#new" do
  #   it "is sucessful" do
  #     get :new, :question_id => question.id
  #     expect(response).to be_success
  #   end
  # end

  # context "#create" do
  #   it "with valid attributes" do
  #     expect {
  #       post :create, :question_id => question.id, :answer => attributes_for(:answer)
  #       }.to change { Answer.count }.by(1)
  #   end

  #   it "with invalid attributes" do
  #     expect {
  #       post :create, :question_id => question.id, :answer => {}
  #       expect(response).to be_redirect
  #       }.to_not change { Answer.count }
  #   end
  # end

  # context "#edit" do
  #   it "is sucessful" do
  #     get :edit, :question_id => question.id, :id => answer.id
  #     expect(response).to be_success
  #   end

  #   it "assigns @answer to a particular answer" do
  #     get :edit, :question_id => question.id, :id => answer.id
  #     expect(assigns(:answer)).to eq(answer)
  #   end
  # end

  # context "#update" do
  #   it "with valid attributes" do
  #     expect {
  #       put :update, :question_id => question.id, :id => answer.id, :answer => { :body => "CRAP!" }
  #       expect(response).to be_redirect
  #       }.to change { answer.reload.body }.from(answer.body).to("CRAP!")
  #   end

  #   it "with invalid attributes" do
  #     expect {
  #       put :update, :question_id => question.id, :id => answer.id, :answer => {}
  #       expect(response).to redirect_to(edit_question_answer_path)
  #       }.to_not change { answer.reload.body }
  #   end
  # end
end