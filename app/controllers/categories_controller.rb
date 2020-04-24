# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[update show edit]

  before_action :require_admin, except: %i[index show]

  def new
    @category = Category.new
  end

  def show
    @category_articles = @category.articles.paginate(page: params[:page], per_page: 5)
  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def create
    pp 'create category'

    @category = Category.new(category_params)

    if @category.save

      flash[:success] = 'Successfully created category.'

      redirect_to categories_path

    else

      render 'new'

    end
  end

  def edit
    pp 'Edit Category'
  end

  def update
    if @category.update(category_params)
      flash[:success] = 'Category name was successfully updated.'
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    @category = params.require(:category).permit(:name)
  end

  def require_admin
    if !logged_in? || (logged_in? && !current_user.admin?)

      flash[:danger] = "You don't have permission to do this action."

      redirect_to categories_path

    end
  end
end
