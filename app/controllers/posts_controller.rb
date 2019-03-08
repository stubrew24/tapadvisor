class PostsController < ApplicationController
  before_action :taproom_route?

  def index
    @posts = Post.where(taproom_id: @tap_id)
  end

  def new
    @post = Post.new
    @taproom = Taproom.find(@tap_id)
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    @taproom = Taproom.find(@tap_id)
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def publish
    @post = Post.find(params[:id])
    if @post.published
      @post.update(published: false)
      redirect_to post_path(@post)
    else
      @post.update(published: true)
      redirect_to post_path(@post)
    end
  end

  def destroy
  end

  private

  def posts_params
    params.require(:post).permit(:title, :content, :taproom_id, :img_url)
  end

  def taproom_route?
    if current_user.taproom_id
      @tap_id = current_user.taproom_id
    else
      redirect_to root_path
    end
  end

end
