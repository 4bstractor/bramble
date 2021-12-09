class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :quote
      t.string :hashed_password
      t.string :salt
      t.string :auth_token
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      t.string :access_token

      t.timestamps
    end
  end
end
