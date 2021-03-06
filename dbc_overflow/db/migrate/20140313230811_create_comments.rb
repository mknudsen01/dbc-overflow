class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.belongs_to :user
      t.references :commentable, polymorphic: true
    end
  end
end
