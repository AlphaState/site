class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :exception
  before_action :set_locale

  def home
    @projects = Project.all
  end

  def manifesto
  end

  def exception
    render nothing: true, layout: 'exception'
  end

  private

  def default_url_options options = {}
    { locale: I18n.locale }
  end

  def set_locale
    locale = params[:locale] || I18n.default_locale
    I18n.locale = locale if I18n.available_locales.include? locale.to_sym
  end
end
