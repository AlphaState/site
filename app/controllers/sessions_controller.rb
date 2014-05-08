class SessionsController < ApplicationController
  def new
  end

  def create
    unless [ :email, :password ].all? { |field| params.include? field }
      render :new
      return
    end

    user = User.find_by_email params[:email]

    if user.present? && user.authenticate(params[:password])
      remember_current_user user
      redirect_to home_path
    else
      render :new
    end
  end

  def destroy
    forget_current_user
    redirect_to home_path
  end
end
