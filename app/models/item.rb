class Item < ApplicationRecord

  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_burden
  belongs_to :prefecture
  belongs_to :shipping_day


  validates :name,                presence: true
  validates :description,         presence: true
  validates :price,               presence: true,
                                  numericality: {
                                    only_integer: true,
                                    greater_than_or_equal_to: 300,
                                    less_than_or_equal_to: 9_999_999,
                                    message: '300〜9,999,999円の間で入力してください'
                                  }
  validates :price,               format: { with: /\A[0-9]+\z/, message: '半角数字で入力してください'}
  validates :category_id,         presence: true, numericality: { other_than: 1 }
  validates :condition_id,        presence: true, numericality: { other_than: 1 }
  validates :shipping_burden_id,  presence: true, numericality: { other_than: 1 }
  validates :prefecture_id,       presence: true, numericality: { other_than: 1 }
  validates :shipping_day_id,     presence: true, numericality: { other_than: 1 }
  validates :user,                presence: true
  validates :image,                presence: true
end


