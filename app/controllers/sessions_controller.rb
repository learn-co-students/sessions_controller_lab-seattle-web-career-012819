class SessionsController < ApplicationController
  before_action :allow_create, only: [:create]
  
  # implied #new

  def create
    session[:name] = params[:name]
    redirect_to controller: "application", action: "welcome"
  end

  def destroy
    session.delete :name
    redirect_to controller: "application", action: "welcome"
  end

  private

  def allow_create
    return redirect_to(controller: "sessions", action: "new") if !params[:name] || params[:name].empty?
  end
end
