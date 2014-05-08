module Authenticable
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def remember_current_user user
    @current_user = user
    session[:user_id] = user.id
  end

  def forget_current_user
    @current_user = nil
    session.delete :user_id
  end
end
