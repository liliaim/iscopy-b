class Spot < ApplicationRecord
  validates :prefecture_id,  presence: true
  validates :icon_id, numericality: { other_than: 1 , message: "can't be blank"} 

  validates :spot_name,    presence: true
  validates :prefecture_id,  presence: true
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}


  belongs_to :user


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :icon

end
