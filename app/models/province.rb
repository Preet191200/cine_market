class Province < ApplicationRecord
  has_many :addresses
  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "gst_rate", "pst_rate", "hst_rate", "created_at", "updated_at"]
  end
end