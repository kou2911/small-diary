class Diary < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  validates :content, presence: true, unless: :was_attached?
  validates :place,   presence: true
  

  def was_attached?
    self.image.attached?
  end


end
