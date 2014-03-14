class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string   :body, null: false
      t.belongs_to :question
      t.belongs_to :user
    end
  end
end
