class ItemsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @items=Item.all.order("created_at desc")
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

  def edit
    @item = Item.find(params[:id]) 
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to root_path
    else
      render 'show'
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      redirect_to root_path
    else
    render 'edit'
   end
  end

  private

  def items_params
    params.require(:item).permit(:name, :info, :category_id, :condition_id, :send_cost_id, :area_id, :delivery_id, :price, :image).merge(user_id: current_user.id)
  end
end
