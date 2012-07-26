class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.text :text
			t.references :user
			t.references :story

      t.timestamps
    end
  end
end
