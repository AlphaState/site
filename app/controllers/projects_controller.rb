class ProjectsController < ApplicationController
  include Restful

  private

  def post_params
    params.require(:project).permit \
      :title, :motto, :thumbnail, :address, :priority, :content
  end

  def collection_path
    home_path
  end
end
