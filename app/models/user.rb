class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_one :address

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "email", "created_at", "updated_at"]
  end
end