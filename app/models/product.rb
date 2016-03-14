class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :categories
  has_many :order_items

  default_scope { where(active: true) }
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :price, presence: true
end
