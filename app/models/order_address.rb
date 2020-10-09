class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :area_id, :cities, :number, :building, :telephone, :order_id, :token 

 with_options presence: true do
  validates :cities, :number, :token
  validates :postcode, format: {with:/\A\d{3}[-]\d{4}\z/}
  validates :telephone, length: { maximum: 11 }
 end

 with_options numericality: {other_than: 1}  do
  validates :area_id
 end

 with_options  presence:true do
 end

  def save
    order = Order.create(user_id:user_id, item_id: item_id)
    Address.create(postcode: postcode, area_id: area_id, cities: cities, number: number, building: building, telephone: telephone, order_id: order.id)
  end
end