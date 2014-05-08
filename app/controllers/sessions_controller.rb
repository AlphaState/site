class SessionsController < ApplicationController
  def new
  end

  def create
    return unless [ :email, :password ].all? { |field| params.include? field }
    user = User.find_by_email params[:email]
    return if user.blank?
    remember_current_user user if user.authenticate params[:password]
  ensure
    redirect_to root_path
  end

  def destroy
    forget_current_user
    redirect_to root_path
  end
end
