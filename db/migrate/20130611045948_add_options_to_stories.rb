class AddOptionsToStories < ActiveRecord::Migration
  def change
    add_column :stories, :piece_char_limit, :integer
    add_column :stories, :minimum_words, :integer
    add_column :stories, :private, :boolean
  end
end
