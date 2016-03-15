class Cart < ActiveRecord::Base
    validates :subtotal, presence: true
    validates :tax, presence: true
    validates :shipping, presence: true
    validates :total, presence: true
  
    enum status: [ :cancelled, :in_progress, :completed, :invoiced ]
end
