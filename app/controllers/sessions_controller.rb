class SessionsController < ApplicationController
  def new
  end

  def create
    session[:login] = params[:login]
    session[:password] = params[:password]

    redirect_to root_path
  end

  def logout
    session[:login] = nil
    session[:password] = nil

    redirect_to root_path
  end
end
