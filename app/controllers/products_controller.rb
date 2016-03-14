class ProductsController < ApplicationController
    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def show
        @product = Product.find(params[:id])
    end

    def edit
        @product = Product.find(params[:id])
    end
    
    def create
        @product = Product.new(params[:product].permit(:title, :price, :description))
        @product.save
        redirect_to products_path
    end
    
    def update
        if @product = Product.find(params[:id])
            @product.update_attributes(params[:product].permit(:title, :price, :description))
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
