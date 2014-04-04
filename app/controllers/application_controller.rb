class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from Exception, with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :page_not_found

  before_action :set_locale

  def home
    @projects = Project.all
  end

  def manifesto
  end

  def page_not_found
    exception code: 404
  end

  private

  def exception code: 500
    respond_to do |format|
      format.html do
        render nothing: true, layout: 'exception', status: code
      end
      format.all do
        render nothing: true, status: code
      end
    end
  end

  def default_url_options options = {}
    { locale: I18n.locale }
  end

  def set_locale
    locale = params[:locale] || I18n.default_locale
    I18n.locale = locale if I18n.available_locales.include? locale.to_sym
  end
end
