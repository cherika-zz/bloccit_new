require 'rails_helper'

RSpec.describe Post, type: :model do

  #1 creating a new instance of the Post class and naming it post. The let
  # method makes it available throughout the rest of the spec, so we only need
  # to instantiate it once.
  let(:post) {Post.create!(title: "New Post Title", body: "New Post Body")}

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
