class TasksController < ApplicationController
  before_action :correct_user, only: [:create, :update, :destroy]

  def create
    @user = User.find_by(id: params[:user_id])
    @task = @user.tasks.build(task_params)
    if @task.save
      flash[:success] = "タスクを作成しました。"
      redirect_to @user
    else
      flash.now[:danger] = "未入力の項目があるか、詳細が長すぎます。（詳細は100字以内）"
      @tasks = @user.tasks.all
      render 'users/show'
    end
  end

  def update
    @user = User.find_by(id: params[:user_id])
    @task = Task.find(params[:task_id])
    if @task.state == "todo"
      @task.state = "done"
    else
      @task.state = "todo"
    end
    @task.save
    redirect_to @user
  end

  def destroy
    @task = Task.find_by(id: params[:task_id])
    if @task.destroy
      flash[:success] = "タスクを削除しました。"
      @user = User.find_by(id: params[:user_id])
      redirect_to @user
    else
    end
  end

  private
    def task_params
      params.require(:task).permit(:title, :description, :state, :due_date)
    end

    def correct_user
      user = User.find_by(id: params[:user_id])
      unless user == current_user
        flash[:danger] = "不正な操作が検出されました。"
        redirect_to root_path
      end
    end
end
