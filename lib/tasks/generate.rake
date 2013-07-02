namespace :generate do
  task :users, [:count] => :environment do |t, args|
    args[:count].to_i.times do
      user = User.create!(
        :username => Faker::Internet.user_name,
        :email => Faker::Internet.email,
        :password => "qwerty",
        :password_confirmation => "qwerty",
        :quote => Faker::Company.bs
      )
      puts "#{user.username} <#{user.email}> -- #{user.quote}"
    end
  end
  task :stories, [:count, :length, :users] => :environment do |t, args|
    args[:count].to_i.times do
      users = User.order("created_at DESC").limit(args[:users].to_i)
      owner = users.pop
      story = Story.create!(
        :title => Faker::Company.catch_phrase,
        :user_id => owner.id
      )
      users.each do |user|
        Member.create!(:user_id => user.id, :story_id => story.id)
      end
      args[:length].to_i.times do
        story.all_users.each do |user|
          story.pieces.create!(:text => Faker::Lorem.sentence(4 + Random.rand(11)), :user_id => user.id)
        end
      end
    end
  end
end
