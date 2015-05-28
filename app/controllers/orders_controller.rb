class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    order = Order.new(order_params)
    order.items << Item.find(params[:item][:id])
    if order.save
      redirect_to order_path(order)
    else
      redirect_to :back, notice: "Sorry somthing went wrong. Please try back later."
    end
  end

  def order_params
    params.require(:order).permit(:name, :description, :user_id)
  end

  def item_params
    params.require(:item).permit(:item_id)
  end
end
