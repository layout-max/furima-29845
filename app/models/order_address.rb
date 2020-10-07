class OrderAddress
  include ActiveModel::ActiveModel
  attr_accessor :user_id, :item_id, :postcode, :area_id, :cities, :number, :building, :telephone

 with option presence: true do
  validate :postcode, :area, :cities, :number, :telephone, :postcode presence: true
  validates :area_id, { other_than: 1 }
  validates :postcode, format: {with:/[-0-9]/}
  validates :telephone, format: {[0-9]{,11}}
 end
  validates :price, presence: true

  def save
    order = Order.create(user_id:user_id, item_id: item_id)
    Address.create(postcode: postcode, area_id: area_id, cities: cities, number: number, bulding: building, telephone: telephone)
  end
end