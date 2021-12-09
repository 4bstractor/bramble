class CreatePieces < ActiveRecord::Migration[6.1]
  def change
    create_table :pieces do |t|
      t.text :text

      t.integer :user_id
      t.integer :story_id

      t.timestamps
    end
  end
end
