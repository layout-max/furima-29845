class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      return redirect_to root_path
    end
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      @order.save
      Payjp.api_key = ENV["PAYJP_secret_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: params[:token],
        currency: 'jpy'
      )
      redirect_to root_path
      else
        render 'index'
    end
  end

  private

  def order_params
    params.permit(:item_id, :area_id, :cities, :number, :telephone, :building, :postcode, :token).merge(user_id: current_user.id)
  end
end