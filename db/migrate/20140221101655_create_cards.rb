class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :deck_id
      t.string :question
      t.string :answer
    end
    add_index :cards, :deck_id
    add_index :cards, :question
    add_index :cards, :answer
  end
end
