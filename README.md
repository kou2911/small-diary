# アプリケーション名
## Small-Diary  
<br>

# 概要
このアプリケーションは日記をお手軽に付けることができるものです。<br> 日記のルールとして投稿できる文字数は15文字以内となっています。<br><br>

# 本番環境
https://small-diary2911.herokuapp.com/

ログイン情報(テスト用)<br>
・Eメール:test@gmail.com<br>
・パスワード:test12345
<br><br>

# 制作背景(意図)
思い出話のひとつとして使えるアプリケーションを作成したいという思いがあり作成しました。

社会人になり、今まで身近に遊べた友達が就職で地方や都市などに行きなかなか会えない友人たちと電話をした際に、このSmall-Diaryを使うことでこの日にこんな出来事があったなどで盛り上がるのではと思いました。

内容として投稿できる文字数を少なくすることで、お手軽で日記を付けることが苦手な人でも使いやすいアプリケーションをイメージしました。

# DEMO
## トップページ
<img width="1070" alt="top" src="https://user-images.githubusercontent.com/88520174/148635957-54c2c50a-8b58-43c9-b4f3-042ec2bdc3ff.png"><br>

トップページにはハンバーガーメニューがありそこからさまざまなページに飛ぶことができる。(下記参照)
https://gyazo.com/c54ec7bc7f58604a088c7f3d502c7ce5
<br><br>


## 新規登録ページ
<img width="1067" alt="スクリーンショット 2022-01-08 16 34 56" src="https://user-images.githubusercontent.com/88520174/148636044-e2bf2207-b8b3-42bf-bc71-a128b2aee7a4.png"><br>  
新規登録をすることでトップページの内容が変わり投稿することができる。(下記参照)
https://gyazo.com/e12d61dfbcd8b615ae69f0ee3ca59b0a
<br><br>



## 新規投稿ページ
<img width="1070" alt="スクリーンショット 2022-01-08 16 43 52" src="https://user-images.githubusercontent.com/88520174/148636320-87458560-b049-4471-8c18-e411e1d4f412.png"> <br>
<br>
投稿することで投稿一覧ページに遷移する(下記参照)
https://gyazo.com/716c26572a63cb12dc0bffb5935e589f
<br><br>

## 投稿一覧ページ
<img width="1439" alt="スクリーンショット 2022-01-08 16 52 39" src="https://user-images.githubusercontent.com/88520174/148636608-ea6ab145-d6bd-4293-9ad0-481e33996d52.png"><br>
<br>
ここでは今までに投稿した一覧が表示できる編集を押すと編集ページに遷移する。(下記参照)
https://gyazo.com/c970a260b8edf8d47b5bbb4a28da1144

## お問い合わせページ
<img width="1439" alt="スクリーンショット 2022-01-08 16 58 32" src="https://user-images.githubusercontent.com/88520174/148636743-ff81ec14-4adb-4694-a722-1b7e6f6985f3.png"><br>
<br>
ここではユーザーからのフィードバックをもらうためにお問い合わせ機能を実装している。送信した内容は私に届く仕組みになっている。

# 工夫したポイント
このオリジナルアプリケーションで工夫した点は、ユーザーにとって使いやすくすることと見た目にこだわった点です。<br>ところどころに絵を配置したり、ハンバーガーメニューを使ったりと素人ながらUI/UXにこだわりました。またお問い合わせ機能を入れることでユーザー目線からの意見をもらいアプリケーションの質をあげます。
<br><br>

# 使用技術(開発環境)
## バックエンド
Ruby, Ruby on Rails<br> <br>
## フロントエンド
Html, Css(Tailswindcss), Scss, JavaScript,  Jquery<br><br>

## データベース
MySQL, Sequel Pro, AWS(S3)

## インフラ
Heroku<br><br>

# 課題、今後の追加実装
大きな課題としては画像アップロードの速度があるためダイレクトアップロードに変えようと思っています。
また、追加実装としてSNS認証の導入をします。特にLINEと連携ができればスムーズで使いやすいアプリになると考えています。<br><br>






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

