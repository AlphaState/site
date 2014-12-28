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

  def expire_index
    expire_page(controller: :application, action: :home, locale: I18n.locale)
  end
end
