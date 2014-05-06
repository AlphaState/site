class PostsController < ApplicationController
  include Restful

  private

  def post_params
    params.require(:post).permit \
      :title, :author, :date, :description, :address, :content
  rescue
    {}
  end
end
