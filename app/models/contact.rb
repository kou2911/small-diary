class Contact < ApplicationRecord
  validates :name, presence: true
  validates :memo, presence: true
end
