require 'yaml'
require 'faker'

USER_COUNT = 10
POST_PER_USER_COUNT = 10
USER_COMMENT_PER_POST_COUNT = 1
ALBUMS_PER_USER_COUNT = 10
PICTURE_PER_ALBUM_COUNT = 5
TODOS_PER_USER_COUNT = 20

users = []
USER_COUNT.times do |i|
  fname = Faker::Name.first_name
  lname = Faker::Name.last_name
  users << {
    id: i + 1,
    name: "#{fname} #{lname}",
    username: Faker::Internet.username
  } 
end

posts = []
posts_count = 1
users.each do |user|
  POST_PER_USER_COUNT.times do |i|
    posts << {
      id: posts_count,
      user_id: user[:id],
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph,
    }
    posts_count += 1
  end
end


comments = []
comment_count = 1
users.each do |user|
  posts.each do |post|
    USER_COMMENT_PER_POST_COUNT.times do
      comments << {
        id: comment_count,
        user_id: user[:id],
        post_id: post[:id],
        message: Faker::Lorem.paragraph,
      }
      comment_count += 1
    end
  end
end

albums = []
albums_count = 1
users.each do |user|
  ALBUMS_PER_USER_COUNT.times do |i|
    albums << {
      id: albums_count,
      user_id: user[:id],
      title: Faker::Lorem.sentence,
    }
    albums_count += 1
  end
end


photos = []
photos_count = 1
users.each do |user|
  albums.each do |album|
    PICTURE_PER_ALBUM_COUNT.times do 
      photos << {
        id: photos_count,
        user_id: user[:id],
        album_id: album[:id],
        title: Faker::Lorem.sentence,
        image_url: "https://via.placeholder.com/600/e8e8e8",
        image_thumbnail_url: "https://via.placeholder.com/150/e8e8e8",
      }
      photos_count += 1
    end
  end
end

todos = []
todos_count = 1
users.each do |user|
  TODOS_PER_USER_COUNT.times do
    todos << {
      id: todos_count,
      user_id: user[:id],
      title: Faker::Lorem.paragraph,
      completed: Faker::Boolean.boolean
    }
    todos_count += 1
  end
end


File.write("./_data/users.yml", YAML.dump(users.map {|obj| obj.transform_keys(&:to_s) }))
File.write("./_data/posts.yml", YAML.dump(posts.map {|obj| obj.transform_keys(&:to_s) }))
File.write("./_data/comments.yml", YAML.dump(comments.map {|obj| obj.transform_keys(&:to_s) }))
File.write("./_data/albums.yml", YAML.dump(albums.map {|obj| obj.transform_keys(&:to_s) }))
File.write("./_data/photos.yml", YAML.dump(photos.map {|obj| obj.transform_keys(&:to_s) }))
File.write("./_data/todos.yml", YAML.dump(todos.map {|obj| obj.transform_keys(&:to_s) }))

