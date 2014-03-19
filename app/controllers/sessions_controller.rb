class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      sign_in @user
      flash[:notice] = 'You are logged in'
    else
      flash[:notice] = 'Wrong password or email'
      render :new
    end
    redirect_to controller: :uploads, action: :index
  end

  def destroy
    sign_out
  end
end
