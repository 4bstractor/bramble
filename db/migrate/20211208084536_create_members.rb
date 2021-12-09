class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members, :id => false do |t|
      t.integer :user_id
      t.integer :story_id
    end
  end
end
