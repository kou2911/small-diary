class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'バグ、不具合について' },
    { id: 3, name: '新機能の提案' },
    { id: 4, name: '使ってみた感想' },
    { id: 5, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :contacts
  end