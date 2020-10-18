class Item < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :condition 
  belongs_to_active_hash :send_cost
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery

  validates :name, :image, :info, :category, :condition, :send_cost, :area, :delivery, :price, presence: true
  validates :category_id, :condition_id, :send_cost_id, :area_id, :delivery_id, numericality: { other_than: 1 , message: "は--以外の値にしてください。"}
  validates :price, inclusion: { in: 300..9_999_999 }
  validates :price, format: {with:/[0-9]/, message: "は半角数字で入力してください。"}
end