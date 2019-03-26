class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  before_action :correct_user, only: [:show]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザーを登録しました。"
      redirect_to login_path
    else
      flash[:danger] = "ユーザーの登録に失敗しました。"
      render :new
    end
  end
  
  private
  
  # Strong Paramter
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
