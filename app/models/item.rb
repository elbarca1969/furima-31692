class Item < ApplicationRecord

  with_options presence: true do
    validates :item_name
    validates :content
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :ship_day_id, numericality: { other_than: 1 }
    validates :price,
                    format: { with: greater_than_or_equal_to: 300 },
                    format: { with: less_than_or_equal_to: 9,999,999 },
                    format: { with: /\A[0-9]+\z/ }
    validates :image
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :ship_day

end
