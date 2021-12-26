class Diary < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  validates :content, presence: true, length:{maximum:15}
  validates :place,   presence: true, length:{maximum:30}

end
