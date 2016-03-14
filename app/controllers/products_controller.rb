class ProductsController < ApplicationController
    
    
    def index
        @products = Product.paginate(page: params[:page])
    end

    def new 
        @product = Product.new 
        @categories = Category.all.map{|c| [ c.name, c.id ] }
    end

    def show
        @product = Product.find(params[:id])
    end
    
    def category_products
        @products = Product.where(category_id: @author.id)
    end

    def edit
        @product = Product.find(params[:id])
        @categories = Category.all.map{|c| [ c.name, c.id ] }
    end
    
    def create
        @product = Product.new(params[:product].permit(:title, :price, :description))
        @product.category_id = params[:category_id]
        @product.save
        redirect_to products_path
    end
    
    def update
        if @product = Product.find(params[:id])
            @product.update_attributes(params[:product].permit(:title, :price, :description))
            @product.category_id = params[:category_id]
        end
        redirect_to products_path
    end
    
    def destroy
        if @product = Product.find(params[:id])
            @product.delete
        end
        redirect_to products_path
    end
end
