class PostsController < ApplicationController
  before_action :find, only: [ :show, :edit, :update ]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to @post
    else
      render 'edit'
    end
  end

  def edit
  end

  def update
    if params.include? :delete
      @post.destroy
      redirect_to posts_path
    elsif @post.update_attributes post_params
      redirect_to @post
    else
      render 'edit'
    end
  end

  private

  def find
    @post = Post.find_by_param! params[:id]
  end

  def post_params
    params.require(:post).permit \
      :title, :author, :date, :description, :address, :content
  end
end
