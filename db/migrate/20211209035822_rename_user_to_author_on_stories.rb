class RenameUserToAuthorOnStories < ActiveRecord::Migration[6.1]
  def change
    rename_column :stories, :user_id, :author_id
  end
end
