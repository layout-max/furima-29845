class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def items_params
    params.require(:item).permit(:name, :info, :category_id, :condition_id, :send_cost_id, :area_id, :delivery_id, :price, :image).merge(user_id: current_user.id)
  end
  
  def index
  end
end
