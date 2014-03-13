class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.boolean :positive, null: false
      t.belongs_to :user
      t.references :voteable, polymorphic: true
    end
  end
end
