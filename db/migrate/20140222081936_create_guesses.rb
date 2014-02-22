class CreateGuesses < ActiveRecord::Migration
  def change
  	create_table :guesses do |t|
      t.integer :round_id
      t.integer :user_id
      t.boolean :result
      t.timestamps
    end
  end
end
