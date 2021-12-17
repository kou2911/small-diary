class Diary < ApplicationRecord
  has_one_attached :image
  validates :content, presence: true
  validates :place,   presence: true
  

end
