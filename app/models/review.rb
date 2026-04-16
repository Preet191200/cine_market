class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :body, presence: true
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :user_id, uniqueness: { scope: :product_id, message: "can only review each product once" }

  def self.ransackable_attributes(auth_object = nil)
    [ "id", "user_id", "product_id", "rating", "body", "created_at" ]
  end
end