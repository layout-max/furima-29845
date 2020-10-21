class SearchController < ApplicationController

  before_action :search_item, only: [:index, :search]

  def new
    @p = Item.ransack(params[:q])
    @items = Item.all
    set_item_column
    set_category_column
    set_condition_column
    set_sendcost_column
    set_area_column
    set_delivery
    @results = @p.result.includes(:user)
  end

  #def index
    #@items = Item.all
    #set_item_column
    #set_category_column
    #set_condition_column
    #set_send_cost_column
    #set_area_column
    #set_delivery
  #end

  #def search
    #@result = @p.result.includes(:user)
  #end

  private

  def search_item
    @p = Item.ransack(params[:q])
  end

  def set_item_column
    @item_name = Item.select("name").distinct
  end

  def set_category_column
    @item_category = Category.all
  end

  def set_condition_column
    @item_condition = Condition.all
  end

  def set_sendcost_column
    @item_sendcost = SendCost.all
  end

  def set_area_column
    @item_area = Area.all
  end

  def set_delivery
    @item_delivery = Delivery.all
  end
end
