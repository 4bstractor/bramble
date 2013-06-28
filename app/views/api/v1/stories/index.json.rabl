collection @stories, :root => "stories"
attributes :id, :title, :piece_char_limit, :minimum_words, :created_at

# Replace this with a check to see if its the users turn
# Or use this check to return the turn boolean flag and always return the url
if current_user.present?
  node(:add_url) { |story| "placeholder url" }
end

child :pieces do
  attributes :id, :text, :created_at
end
