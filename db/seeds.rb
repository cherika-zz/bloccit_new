include RandomData

# Create Posts
50.times do
  Post.create!(
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
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} ads created"
puts "#{Question.count} questions created"
