include RandomData

#Create Users
5.times do
  user = User.create!(
  name: RandomData.random_name,
  email: RandomData.random_email,
  password: RandomData.random_sentence
  )
end
users = User.all

admin = User.create!(
  name: "Admin User",
  email: "admin@example.com",
  password: "helloworld",
  role: "admin"
)

member = User.create!(
  name: "Member User",
  email: "member@example.com",
  password: "helloworld",
  role: "member"
)

moderator = User.create!(
  name: "Moderator User",
  email: "moderator@example.com",
  password: "helloworld",
  role: "moderator"
)

user = User.first
user.update_attributes!(
  email: 'hakobyan.sn@gmail.com',
  password: 'password'
)

#Create Topics
15.times do
  Topic.create!(
  name: RandomData.random_sentence,
  description: RandomData.random_paragraph
  )
end
topics = Topic.all

# Sponsored Posts
# 15.times do
#   SponsoredPost.create!(
#   topic: topics.sample,
#   title: RandomData.random_sentence,
#   body: RandomData.random_paragraph,
#   price: RandomData.random_number
#   )
# end
# sponsored_posts = SponsoredPost.all

# Create Posts
50.times do
  Post.create!(
    user: users.sample,
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end
comments = Comment.all

# 10.times do
#   Advertisement.create!(
#     title: RandomData.random_sentence,
#     copy: RandomData.random_paragraph,
#     price: RandomData.random_number
#   )
# end
# advertisements = Advertisement.all

# 10.times do
#   Question.create!(
#     title: RandomData.random_sentence,
#     body: RandomData.random_paragraph
#   )
# end
# questions = Question.all

# puts "#{Post.count} posts before"
# Post.find_or_create_by(title: "This is a unique post title", body: "Very Unique")
# puts "#{Post.count} posts after"
#
# puts "#{Comment.count} comments before"
# Comment.find_or_create_by(body: "Very Unique")
# puts "#{Comment.count} comments after"

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
# puts "#{Advertisement.count} ads created"
# puts "#{Question.count} questions created"
# puts "#{SponsoredPost.count} sponsored posts created"
puts "#{User.count} users created"
