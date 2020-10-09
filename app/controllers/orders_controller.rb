class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: [:index]
  before_action :SetItem, only: [:index, :create]

  def index
    if @item.user_id == current_user.id
      return redirect_to root_path
    end
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay
      @order.save
      redirect_to root_path
      else
        render 'index'
    end
  end

  private

  def order_params
    params.permit(:item_id, :area_id, :cities, :number, :telephone, :building, :postcode, :token).merge(user_id: current_user.id)
  end

  def move_to_index
    unless  @item.order == nil
      redirect_to root_path
    end
  end

  def pay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def SetItem
    @item = Item.find(params[:item_id])
  end
end