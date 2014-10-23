class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(email: params[:email]).first
    if user && user.authenticated(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in as #{user.name}"
    else
      flash.now.alert = 'Email or Password is invalid.'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Signed Out!'
  end
end
