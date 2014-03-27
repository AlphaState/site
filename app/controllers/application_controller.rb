class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :page_not_found
  before_action :set_locale

  def home
  end

  def manifesto
  end

  def page_not_found
    render text: 'Кто здесь?', status: 404
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
