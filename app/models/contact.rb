class Contact < ApplicationRecord
  validates :memo, presence: true
  validates :genre_id, numericality: { other_than: 0, message: "can't be blank" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
end
