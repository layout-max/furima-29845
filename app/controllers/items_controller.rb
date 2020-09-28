class ItemsController < ApplicationController
  before_action :authenticate_user!

  private

  def items_params
    params.require(:items).permit(:text, :image).merge(user_id: current_user.id)
  end
  
  def index
  end
end
