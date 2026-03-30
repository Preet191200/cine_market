class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :products, through: :order_items

  validates :status, presence: true
  validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def self.ransackable_attributes(auth_object = nil)
    ["id", "user_id", "total_price", "status", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user", "order_items", "products"]
  end
end