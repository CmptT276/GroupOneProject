class CategoriesController < ApplicationController
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
  
end
