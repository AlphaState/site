class ApplicationController < ActionController::Base
  include Authenticable

  protect_from_forgery with: :exception

  unless Rails.env.development?
    rescue_from Exception, with: :exception
    rescue_from ActiveRecord::RecordNotFound, with: :page_not_found
  end

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
        render template: 'layouts/exception', layout: false, status: code
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
