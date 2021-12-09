class CreateStories < ActiveRecord::Migration[6.1]
  def change
    create_table :stories do |t|
      t.string :title
      t.integer :piece_char_limit
      t.integer :minimum_words
      t.boolean :private

      t.integer :user_id

      t.timestamps
    end
  end
end
