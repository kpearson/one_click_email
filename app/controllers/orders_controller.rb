class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    order = Order.new(order_params)
    if order.save
      redirect_to orders_path(order)
    else
      redirect_to :back, notice: "Sorry somthing went wrong. Please try back later."
    end
  end
end
