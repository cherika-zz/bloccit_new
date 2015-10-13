require 'rails_helper'
include RandomData

RSpec.describe PostsController, type: :controller do

#8, we create a post and assign it to my_post using let.
# We use RandomData to give my_post a random title and body.
  let(:my_post) { Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

#9, because our test created one post (my_post), we expect index to return an array of one item. This is achieved using assigns,
# a method in ActionController::TestCase. assigns gives the test access to "instance variables assigned in the action that are available for the view".
    it "assigns [my_post] to posts" do
      get :index
      expect(assigns(:posts)).to eq([my_post])
    end
  end



  #1
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    #2 we expect the PostsController#new to render the posts new view
    it "renders the new view" do
      get :new
      expect(response).to render_template :new
    end

    #3 we expect the @post instance to be initialized by PostsController#new.
    # assigns gives us access to the @post variable, assigning it to :post
    it "instantiates @post" do
      get :new
      expect(assigns(:post)).not_to be_nil
    end
  end

#4 we expect that after PostsController#create is called with parameters, the count
# of post instances will increase by one. Create creates the fields in a post.
  describe "POST create" do
    it "increases the number of Post by 1" do
      expect{post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Post, :count).by(1)
    end

    #5 we expect the newly created post to be assigned to @post
    it "assigns the new post to @post" do
      expect(assigns(:post)).to eq Post.last
    end

    #6 we expect to be redirected to the newly created post
    it "redirects to the new post" do
      post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(response).to redirect_to Post.last
    end
  end

# we pass {id: my_post.id} to show as a parameter. These parameters are passed to the params hash.
  describe "GET show" do
    it "returns http success" do
      get :show, {id: my_post.id}
      expect(response).to have_http_status(:success)
    end

    # we expect the response to return the show view
    it "renders the show view" do
      get :show, {id: my_post.id}
      expect(response).to render_template :show
    end

    #we expect the post to equal my_post because we call show with the id of my_post
    it "assigns my_post to @post" do
      get :show, {id: my_post.id}
      expect(assigns(:post)).to eq(my_post)
    end
  end


  #
  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
