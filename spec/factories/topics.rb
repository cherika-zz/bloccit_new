include RandomData

FactoryGirl.define do
  factory :post do
    title RandomData.random_sentence
    body RandomData.random_paragraph
    topic
    user
    rank 0.0
  end

  factory :topic do
    name RandomData.random_sentence
    description RandomData.random_paragraph
  end
end
