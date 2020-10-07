class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      return redirect_to root_path
    end
    @order = Order.new
  end

  def create
    redirect_to action: :index
    Address.create(order_params)
  end

  private

  def order_params
    params.permit(:area_id, :cities, :number, :telephone, :building, :postcode).merge(user_id: current_user.id)
  end
end