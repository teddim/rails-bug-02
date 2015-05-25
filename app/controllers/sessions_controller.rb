class SessionsController < ApplicationController
  skip_before_action :ensure_current_user

  def new
    puts "**********Session New"
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @user = User.new(email: params[:user][:email])
      @user.errors[:base] << "Username / password is invalid"
      render :new
    end
  end

  def destroy
    puts "**********Session Destroy"
    session.destroy
    redirect_to signin_path
  end

end
