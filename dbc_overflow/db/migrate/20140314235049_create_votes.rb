class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :positive
      t.belongs_to :user
      t.belongs_to :voteable, polymorphic: true
    end
  end
end
