class Order < ApplicationRecord
  validates :price, presence: true
  belongs_to :items
  has_one :users
  has_one :address
end
