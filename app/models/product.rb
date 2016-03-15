class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :categories

  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :price, presence: true
end
