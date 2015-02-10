class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to '/'
    else
      redirect_to '/new', :flash => { error: 'Complete all fields' }
    end
  end

  def show
    @post = Post.find_by(slug: params[:slug])
  end

  def edit
    @post = Post.find_by(slug: params[:slug])
  end

  def update
    post = Post.find_by(slug: params[:slug])
    post.update(post_params)
    if post.save
      redirect_to '/' << params[:slug]
    else
      redirect_to '/edit/' << params[:slug], :flash => { error: 'Complete all fields' }
    end
  end

  def delete
    Post.find_by(slug: params[:slug]).destroy
    redirect_to '/'
  end

  private

  def post_params
    params.require(:post).permit(:title, :slug, :message)
  end

  def create_slug

  end
end
