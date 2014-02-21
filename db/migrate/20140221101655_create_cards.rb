class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.belongs_to :deck
      t.string :question
      t.string :answer
    end
    #add_index :cards, :deck_id, :question, :answer
  end
end
