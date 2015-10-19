class SponsoredPostsController < ApplicationController
  def index
    @topic = Topic.find(params[:topic_id])
    @sponsored_posts = @topic.sponsored_posts.all
  end

  def show
    @sponsored_post = SponsoredPost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sponsored_post = SponsoredPost.new
  end


  def create
    # we call Post.new to create a new instance of Post
    @sponsored_post = SponsoredPost.new
    @sponsored_post.title = params[:sponsored_post][:title]
    @sponsored_post.body = params[:sponsored_post][:body]
    @sponsored_post.price = params[:sponsored_post][:price]
    @topic = Topic.find(params[:topic_id])

    #35 we assign a topic to a post.
    @sponsored_post.topic = @topic

    if @sponsored_post.save
      flash[:notice] = "Post was saved."
      # redirecting to posts show view
      redirect_to [@topic, @sponsored_post]
    else
      flash[:error] = "There was an error saving your post. Please try again."
      render :new
    end
  end

  def edit
    @sponsored_post = SponsoredPost.find(params[:id])
  end

  def update
    @sponsored_post = SponsoredPost.find(params[:id])
    @sponsored_post.title = params[:sponsored_post][:title]
    @sponsored_post.body = params[:sponsored_post][:body]
    @sponsored_post.price = params[:sponsored_post][:price]

    if @sponsored_post.save
      flash[:notice] = "Post was updated."
      redirect_to [@sponsored_post.topic, @sponsored_post]
    else
      flash[:notice] = "There was an error saving your post. Please try again."
      render :edit
    end
  end

end
