# require 'spec_helper'

# describe AnswersController do
#   let!(:question) { FactoryGirl.create :question }
#   let!(:answer) { FactoryGirl.create :answer}

#   # context "#index" do
#   #   it "is sucessful" do
#   #     get :index, :question => question
#   #     expect(response).to be_success
#   #   end

#   #   it "assigns @answers to Answer.all" do
#   #     get :index
#   #     expect(assigns(:answers)).to eq(Answer.all)
#   #   end
#   # end

#   context "#show" do
#   end

#   context "#new" do
#     it "is sucessful" do
#       get :new, :question_id => question.id
#       expect(response).to be_success
#     end
#   end

#   context "#create" do
#     it "with valid attributes" do
#       expect {
#         post :create, :question_id => question.id, :answer => attributes_for(:answer)
#         }.to change { Answer.count }.by(1)
#     end

#     it "with invalid attributes" do
#       expect {
#         post :create, :question_id => question.id, :answer => {}
#         expect(response).to be_redirect
#         }.to_not change { Answer.count }
#     end
#   end

#   context "#edit" do
#     it "is sucessful" do
#       get :edit, :question_id => question.id, :id => answer.id
#       expect(response).to be_success
#     end

#     it "assigns @answer to a particular answer" do
#       get :edit, :question_id => question.id, :id => answer.id
#       expect(assigns(:answer)).to eq(answer)
#     end
#   end

#   context "#update" do
#     it "with valid attributes" do
#       expect {
#         put :update, :question_id => question.id, :id => answer.id, :answer => { :body => "CRAP!" }
#         expect(response).to be_redirect
#         }.to change { answer.reload.body }.from(answer.body).to("CRAP!")
#     end

#     it "with invalid attributes" do
#       expect {
#         put :update, :question_id => question.id, :id => answer.id, :answer => {}
#         expect(response).to redirect_to(edit_question_answer_path)
#         }.to_not change { answer.reload.body }
#     end
#   end
# end