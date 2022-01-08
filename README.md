# テーブル設計


## usersテーブル

| Column             | Type   | Option                      |
| ------------------ | -----  | ------------------------    |
| email              | string | null: false, unique: true   |
| encrypted_password | string | null: false                 |
| nickname           | string | null: false                 |

## Association

- has_many :diaries


## diaryテーブル


| Column             | Type      | Option                             |
| ------------------ | -----     | ------------------------------     |
| content            | string    | null: false                        |
| place              | string    | null: false                        |
| user               | reference | null: false, foreign_key: true     |

## Association

- belongs_to :user

## contactテーブル


| Column             | Type      | Option                             |
| ------------------ | -----     | ------------------------------     |
| memo               | text      | null: false                        |
| genre_id           | integer   | null: false                        |

