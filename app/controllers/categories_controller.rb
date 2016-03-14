class CategoriesController < ApplicationController
  before_action :admin_user,     only: [:destroy, :edit, :update, :new]
  
  
  def index
      @categories = Category.paginate(page: params[:page])
  end

  def new
      @category = Category.new
  end

  def show
      @category = Category.find(params[:id])
  end

  def edit
      @category = Category.find(params[:id])
  end
  
  def create
      @category = Category.new(params[:category].permit(:name, :description))
      @category.save
      redirect_to categories_path
  end
  
  def update
      if @category = Category.find(params[:id])
          @category.update_attributes(params[:category].permit(:name, :description))
      end
      redirect_to categories_path
  end
  
  def destroy
      if @category = Category.find(params[:id])
          @category.delete
      end
      redirect_to categories_path
  end
  
  private
  
  # Confirms an admin user.
  def admin_user
    users_controller = UsersController.new
    users_controller.request = request
    users_controller.response = response
    users_controller.admin_user
  end
  
end
