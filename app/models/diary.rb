class Diary < ApplicationRecord
  validates :content, presence: true
  validates :place,   presence: true
  

end
