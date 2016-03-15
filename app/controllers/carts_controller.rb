class CartsController < ApplicationController
  def index
    @carts = Cart.all
  end

  def edit
    @cart = Cart.find(params[:id])
    @statuses = Cart.statuses
  end

  def update
    @cart = Cart.find(params[:id])
    @statuses = Cart.statuses
    if @cart.update_attributes(cart_params)
      redirect_to carts_path, notice: "The order has been created."
    else
      render "edit"
    end
  end

private
  def cart_params
    params.require(:order).permit(:subtotal, :tax, :shipping, :total, :status)
  end
end
