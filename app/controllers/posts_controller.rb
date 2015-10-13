class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    #we create an instance variable @post, then assign it an empty post returned by Post.new
    @post = Post.new
  end

  def create
    # we call Post.new to create a new instance of Post
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

    if @post.save
      flash[:notice] = "Post was saved."
      # redirecting to posts show view
      redirect_to @post
    else
      flash[:error] = "There was an error saving your post. Please try again."
      render :new
    end
  end

  def edit
  end
end
