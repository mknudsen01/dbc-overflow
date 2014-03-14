require 'spec_helper'

describe QuestionsController do
  let!(:question) { FactoryGirl.create :question }

  context "#index" do
    it "is sucessful" do
      get :index
      expect(response).to be_success
    end

    it "assigns @questions to Question.all" do
      get :index
      expect(assigns(:questions)).to eq(Question.all)
    end
  end

  context "#show" do
    it "is sucessful" do
      get :show, :id => question.id
      expect(response).to be_success
    end

    it "assigns @question to a particular question" do
      get :show, :id => question.id
      expect(assigns(:question)).to eq(question)
    end

    it "assigns @answers to answers of a particular question" do
      get :show, :id => question.id
      expect(assigns(:answers)).to eq(question.answers)
    end

  end

  context "#new" do
    it "is sucessful" do
      get :new
      expect(response).to be_success
    end
  end

  context "#create" do
    it "with valid attributes" do
      expect {
        post :create, :question => attributes_for(:question)
        }.to change { Question.count }.by(1)
    end

    it "with invalid attributes" do
      expect {
        post :create, :question => {}
        expect(response).to be_redirect
        }.to_not change { Question.count }
    end


  end

  context "#edit" do
    it "is sucessful" do
      get :edit, :id => question.id
      expect(response).to be_success
    end

    it "assigns @question to a particular question" do
      get :edit, :id => question.id
      expect(assigns(:question)).to eq(question)
    end
  end

  context "#update" do
    it "with valid attributes" do
      expect {
        put :update, :id => question.id, :question => { :title => "CRAP!", :body => "balls of chocolate" }
        expect(response).to be_redirect
        }.to change { question.reload.title }.from(question.title).to("CRAP!")
    end

    it "with invalid attributes" do
      expect {
        put :update, :id => question.id, :question => { :title => "" }
        expect(response).to redirect_to(edit_question_path)
        }.to_not change { question.reload.title }
    end
  end
end