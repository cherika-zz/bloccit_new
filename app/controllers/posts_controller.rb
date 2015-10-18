class PostsController < ApplicationController
  # def index
  #   @posts = Post.all
  # end

  def show
    @post = Post.find(params[:id])
  end

  def new
    #we create an instance variable @post, then assign it an empty post returned by Post.new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def create
    # we call Post.new to create a new instance of Post
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    @topic = Topic.find(params[:topic_id])

    #35 we assign a topic to a post.
    @post.topic = @topic

    if @post.save
      flash[:notice] = "Post was saved."
      # redirecting to posts show view
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving your post. Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

    if @post.save
      flash[:notice] = "Post was updated."
      redirect_to [@post.topic, @post]
    else
      flash[:notice] = "There was an error saving your post. Please try again."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      #38, when a post is deleted, we direct users to the topic show view.
      redirect_to @post.topic
    else
      flash[:error] = "There was an error deleting your post."
      render :show
    end
  end
end
