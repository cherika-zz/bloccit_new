require 'rails_helper'
include RandomData

RSpec.describe Post, type: :model do

  #1 old comment - creating a new instance of the Post class and naming it post. The let
  # method makes it available throughout the rest of the spec, so we only need
  # to instantiate it once.

  #3, we create a parent topic for post.
  let(:topic) {Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)}
  let(:user) {User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld")}
  #4, we associate post with topic with topic.posts.create!. This is a chained method call which creates a post for a given topic.
  let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user)}

  it { should have_many(:labelings)}
  it { should have_many(:labels).through(:labelings)}

  it { should have_many(:comments) }
  it { should belong_to(:topic)}
  it { should belong_to(:user)}

  # test that Post validates the presence of title, body, and topic
  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:body)}
  it { should validate_presence_of(:topic)}
  it { should validate_presence_of(:user)}

  # test that Post validates the lengths of title and body
  it { should validate_length_of(:title).is_at_least(5)}
  it { should validate_length_of(:body).is_at_least(20)}

  describe "attributes" do

    #2 we test whether post has an attribute named title. This tests whether
    # post will return a non-nil value when post.title is called.
    it "should respond to title" do
      expect(post).to respond_to(:title)
    end

    #3 similar test with body attribute
    it "should respond to body" do
      expect(post).to respond_to(:body)
    end
  end
end
