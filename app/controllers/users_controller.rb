class UsersController < ApplicationController
  before_action :correct_user, only: [:show, :edit, :destroy]

  def show
    @user = User.find_by(id: params[:id])
    @tasks = @user.tasks.all
    @task = @user.tasks.build
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "ユーザー登録が完了しました。"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    log_out
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  
    def correct_user
      @user = User.find_by(id: params[:id])
      unless @user == current_user
        flash[:danger] = "不正な操作が検出されました。"
        redirect_to root_path
      end
    end
end
