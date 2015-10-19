include RandomData

#Create Topics
15.times do
  Topic.create!(
  name: RandomData.random_sentence,
  description: RandomData.random_paragraph
  )
end
topics = Topic.all

# Sponsored Posts
15.times do
  SponsoredPost.create!(
  topic: topics.sample,
  title: RandomData.random_sentence,
  body: RandomData.random_paragraph,
  price: RandomData.random_number
  )
end
topics = Topic.all

# Create Posts
50.times do
  Post.create!(
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

10.times do
  Advertisement.create!(
    title: RandomData.random_sentence,
    copy: RandomData.random_paragraph,
    price: RandomData.random_number
  )
end
posts = Post.all

10.times do
  Question.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
questions = Question.all

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
puts "#{Advertisement.count} ads created"
puts "#{Question.count} questions created"
puts "#{SponsoredPost.count} sponsored posts created"
