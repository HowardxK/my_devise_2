class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user && @user.authenticate(params[:session][:name])
      session[:user_id] = @user.id
      redirect_to login_path, notice: '登入成功'
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, noitce: '登出成功'
  end
end
