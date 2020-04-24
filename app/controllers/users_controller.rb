# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :user_by_id, only: %i[edit update show]
  before_action :require_same_user, only: %i[edit update]
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to blog #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = 'Account has been updated successfully.'
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  private

  def user_params
    @user = params.require(:user).permit(:username, :email, :password)
  end

  def user_by_id
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:danger] = 'You can only edit your own account.'
      redirect_to root_path
    end
  end
end
