class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string   :body, null: false
      belongs_to :question
      belongs_to :user
    end
  end
end
