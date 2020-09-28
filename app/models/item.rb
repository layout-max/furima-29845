class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to_active_hash :category
end
