class PostsController < ApplicationController
  http_basic_authenticate_with :name => "dhh", :password => "secret", :expection => [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to :root
    else
      flash[:errors] = post.errors.full_messages
      redirect_back fallback_location: root_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to :root
    else
      flash[:errors] = post.errors.full_messages
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to :action => :index
  end

private
  def post_params
    params.require(:post).permit(:title, :text)
  end

end
