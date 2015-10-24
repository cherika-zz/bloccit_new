class PostsController < ApplicationController
  before_action :require_sign_in, except: :show

  def show
    @post = Post.find(params[:id])
  end

  def new
    #we create an instance variable @post, then assign it an empty post returned by Post.new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(post_params)

    @post.user = current_user

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
    @post.update_attributes(post_params)

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

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
