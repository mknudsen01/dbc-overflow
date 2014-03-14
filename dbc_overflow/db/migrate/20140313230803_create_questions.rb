class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string   :title, null: false
      t.string   :body, null: false
      t.integer  :best_answer_id
      t.belongs_to :user
    end
  end
end