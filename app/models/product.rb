class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_fill: [200, 300]
    attachable.variant :large, resize_to_fill: [400, 600]
  end

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.01 }
  validates :stock_quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "description", "price", "stock_quantity", "category_id", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category"]
  end
end