# README

## トップイメージ

<img width="705" alt="トップイメージ_20200707" src="https://user-images.githubusercontent.com/62828568/86699648-5cc95500-c04b-11ea-9aa2-f4bf903dab9d.png">

![ruby](https://img.shields.io/badge/-Ruby-red)
![rails](<https://img.shields.io/badge/-Rails-rgb(220,20,60)>)
![javascript](https://img.shields.io/badge/-JavaScript-yellow)
![jquery](https://img.shields.io/badge/-jQuery-blue)
![html](https://img.shields.io/badge/-HTML-orange)
![css](https://img.shields.io/badge/-CSS-lightblue)
![mysql](https://img.shields.io/badge/-MySQL-lightgreen)
![rspec](https://img.shields.io/badge/-RSpec-lightgrey)
![AWS](https://img.shields.io/badge/-AWS-blueviolet)
![Unicorn](https://img.shields.io/badge/-Unicorn-pink)
![Nginx](https://img.shields.io/badge/-Nginx-yellowgreen)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/RYgithub1/knock-knock)

## アプリケーション名

_Knock-Knock!_
（ノック・ノック！：旅人を探して情報交換するアプリ）

## 概要

マップ上で気になった旅人を選び、旅やプライベートな内容についての相談や情報交換ができるアプリケーションです。

## 製作背景

海外を旅していた際に、次の目的地の「最新の治安状態」や「おすすめアクティビティ」を知りたい事が何度もありました。  
現状適切なツールがなく、旅人同士は現地で出会った人と直接情報交換をする事が多いです。  
最新情報をもっと手軽に、より早く入手できれば、より安全で、満足度が高い体験が出来ると考え製作しました。

---

## 本番環境

デプロイ中になります。

- リンク先
  - URL：http://xxx
- テストユーザー
  - メールアドレス：xxxx@xxxx
  - パスワード ：xxxxxxxx

## 内容

### アプリ遷移図

- 下図の左上赤線枠、トップページ【Knock-Knock】を起点に使用します。

<img width="1185" alt="アプリ遷移図_20200707" src="https://user-images.githubusercontent.com/62828568/86683553-9e9ecf00-c03c-11ea-93fa-5e9b9ecc54e4.png">

### トップページ(MAP)

- マップ上で気になる旅人を選択して、About ME をクリックすると、プロフィールを閲覧できます(要ログインです)。
- 右上の「visiter」ポップアップは、ログイン後に、ログイン中のユーザー情報に変わります。

<img width="1435" alt="トップページ_MAP_20200707" src="https://user-images.githubusercontent.com/62828568/86697603-81bcc880-c049-11ea-9e37-63422507cecc.png">

### トップページ(news)

- 旅に関する最新ニュースを掲載しています。画像をクリックすると別タブで情報元を確認できます。

<img width="1440" alt="トップページ_news_20200707" src="https://user-images.githubusercontent.com/62828568/86697704-9a2ce300-c049-11ea-9600-e7eccaa6d497.png">

### ユーザー登録

- ヘッダー右上のサインアップから、ユーザー登録が可能です。ヘッダーにて「サインアップ/ログイン/ログアウト」を行えます。

<img width="1440" alt="ユーザー登録_20200707" src="https://user-images.githubusercontent.com/62828568/86697834-b92b7500-c049-11ea-8cf6-a9c2d922ef67.png">

### 自分のプロフィール(About ME >トップ)

- ヘッダー下の「Edit > xxx」からプロフィール情報やサインアップ情報を編集できます。

<img width="682" alt="プロフィール_ME_トップ_20200707" src="https://user-images.githubusercontent.com/62828568/86697932-cfd1cc00-c049-11ea-89f1-03478fc7e16e.png">

### 自分のプロフィール(About ME >現在地取得)

- 1 クリックで現在地を取得できます。取得した位置情報が、自分のプロフィール/ポップアップ/マップに反映されます。

<img width="672" alt="プロフィール_ME_位置_20200707" src="https://user-images.githubusercontent.com/62828568/86698057-ef68f480-c049-11ea-910d-dd8895eee0e0.png">

### 他人のプロフィール(About HIM/HER >トップ)

- 他人のプロフィールを確認します。聞きたいことや相談したいことがあれば、「Knock-Knock Door」ボタンを押して、ドアノブチェック画面に進みます。

<img width="667" alt="プロフィール_AZ_トップ_20200707" src="https://user-images.githubusercontent.com/62828568/86698131-fee83d80-c049-11ea-837f-627bda080abe.png">

### 他人のプロフィール(About HIM/HER >ハンガー)

- 相手のことが気になるけどメッセージの送付は一端保留する場合、相手のドアに、ドアハンガーをかけておきます（ホテルでドアにかけるプレートのイメージです）。

<img width="672" alt="プロフィール_AZ_ハンガ_20200707" src="https://user-images.githubusercontent.com/62828568/86698199-10314a00-c04a-11ea-8689-a6fa6baee0ba.png">

### ドア作成ページ(ドアノブチェック)

- 相手のドアノブにチェックをつけて、ノックノック！します。

<img width="669" alt="ドアノブチェック_20200707" src="https://user-images.githubusercontent.com/62828568/86698275-217a5680-c04a-11ea-8a50-bc10376648b0.png">

### メッセージ交換ページ(Knock-Knock Door)

- 気軽に情報交換を行えます。対象はテキストと写真になります。

<img width="773" alt="メッセージ_20200707" src="https://user-images.githubusercontent.com/62828568/86698361-322acc80-c04a-11ea-83ca-5f1b30f07d3f.png">

### ドア一覧ページ(DoorS)

- 誰のドアにドアハンガーをかけているか、また誰のドアをノックノック！したかを、一覧で確認できるページです。最終日時やコメントから、やり取りの進捗を確認します。
- 新着メッセージがある場合、「knocked doors」の下方に赤文字で通知が表示されます。

<img width="791" alt="ドアーズ_20200712" src="https://user-images.githubusercontent.com/62828568/87307535-c3bba200-c554-11ea-830f-676b08ef3552.png">

## 工夫

- マップ関係《MAP》

  - 現在地ボタンを１クリックするだけで位置を取得し、マップやポップアップ等に表示します。
  - マップ上で気になる旅人を選択して、プロフィール画面へ遷移可能です。

- プロフィール関係《About / Hanger》

  - 自分のプロフィール(About ME)の編集ページで、複数の画像をプレビュー確認、投稿できます。
  - 他人のプロフィール(About HimHer)ページで、相手が気になる場合、ドアにドアハンガー(hanger)をかけておき、後で一覧ページから確認できます。

- メッセージ関係《Knock-Knock Door / DoorS》
  - 特定のペア(２ユーザー)につき、メッセージ交換できるドア(Knock-Knock Door)は１つになるように制約をかけています。
  - 一覧で自らの活動状況を確認できます。「ノック・ノックドア作成済みの状況」と「ドアハンガー設置済みの状況」が重複のない形で表示されます。

## 今後の実装予定

1. ■ 操作音の追加
2. □ トップページのフッター
   ■Adventure■OurTeam■Contacts□Currencey□Insights□Guide
3. □ 言語タグ検索の追加
4. □ ユーザー貢献度

---

## 開発環境

- Ruby（2.5.1）
- Rails（5.2.4.3）
- JavaScript
- jQuery（4.4.0）
- HTML5/HAML（5.1.2）
- CSS3/SCSS
- Git（2.26.0）
- MySQL（5.6.47）
- AWS（Linux AMI release 2018.03）
- Unicorn（5.4.1）
- Nginx（1.16.1）

## 機能一覧

- トップ画面

  - 旅のイメージ画像をスライドショー形式で表示(非同期)。
  - サービス全体で Font Awesome を活用
  - Adventure(フッター)にて、旅関連の格言を閲覧可能にする。kaminari を使用して、ページネーション機能を実装。seed で初期値を埋め込む設計。
  - Our Team(フッター)をクリックするとモーダルで、チームポリシーを表示。モーダルの周辺をクリックするとトップ画面に戻る(非同期)。
  - contacts(フッター)から、問い合わせを受付られるようにして、サービス改善等に意見を活用。

- マップ

  - API を活用。
  - 旅人の位置を一覧表示（初期設定では、自分の位置がセンターで表示）。
  - 個々人の情報(名前や要望など)は、カーソルを合わせると非同期で表示。
  - 情報ウィンドウ内のリンクにより気になった人の、プロフィール閲覧画面へアクセス可能。
  - 情報ウィンドウ内の表示内容はプロフィールから抽出。

- ニュース

  - API を活用。
  - 最新の旅関係のニュースを抽出。
  - 画像をクリックすると、ニュースの情報元を参照可能。

- ユーザー管理

  - devise を使用。
  - 新規登録、ログイン、ログアウト、編集の実装。
  - 文字数制約や同名禁止の制約。
  - 右方の四角内に、ログイン中の場合は名前、非ログイン中の場合は visiter と表示(現在地情報を取得済みの場合は、現在地も表示)。

- プロフィール(about)

  - プロフィールの新規作成、表示、編集機能。
  - 画像のアップロードは carrierwave を使用。
  - プレビュー機能あり。アイコンは 1 枚、写真は複数枚投稿可能。
  - 国籍(nationality)は、Active Hash を活用。
  - 言語(language)は、タグ付け機能を実装。acts_as_taggable と、jQuery プラグインの tag-it を使用。タグ名は自由に入力可能。
  - プロフィールページの下方に、現在地取得ボタンを配置。1 クリックで位置情報を取得・保存しマップ等へ反映。
  - 他人のプロフィール画面を閲覧している場合、下方にドアハンガー(Door Hanger)機能が表示される（非同期）。

- メッセージ(knock-knock door)

  - マップ画面 → 他の人のプロフィール画面 → ドアノブチェック画面 → 旅人間のメッセージルームを作成。
  - メッセージルームの重複作成へは制約をかけており不可。
  - LINE 風メッセージ画面。
  - テキストと画像の送付が可能。
  - アクティビティ一覧(DoorS)から、メッセージルームの削除が可能。

- 活動内容の一覧表示(DoorS)

  - お気に入り(door Hangers)や、メッセージルーム(knocked doors)を一覧で表示。
  - 表には bootstrap を使用。
  - 新規メッセージ(未読)がある場合、赤文字で「New message」との通知が表示。
  - 表に最終メッセージや、最終更新日を表示。
  - メッセージを行うと(door hangers)での表示が消える(重複排除)。

- その他
  - テストは RSpec を使用。
  - インフラは AWS,Unicorn,Nginx,Capistrano を活用。

## DB 設計

### ER 図

<img width="1406" alt="ER図_20200712" src="https://user-images.githubusercontent.com/62828568/87242512-5a5e6500-c468-11ea-82f6-d7bdd89c145d.png">

### users Table

| Column   | Type   | Options                   |
| -------- | ------ | ------------------------- |
| name     | string | null: false               |
| email    | string | null: false, unique: true |
| password | string | null: false               |

#### Association(users)

- has_one :about
- has_many :users_pairs
- has_many :pairs, through: :users_pairs
- has_many :messages
- has_many :hangers
- has_many :active_notifications
- has_many :passive_notifications

### users_pairs Table

| Column  | Type   | Options           |
| ------- | ------ | ----------------- |
| user_id | bigint | foreign_key: true |
| pair_id | bigint | foreign_key: true |

#### Association(users_pairs)

- belongs_to :user
- belongs_to :pair

### pairs Table

| Column | Type | Options |
| ------ | ---- | ------- |


#### Association(pairs)

- has_many :users_pairs
- has_many :users, through: :users_pairs
- has_many :messages
  has_many :notifications

### messages Table

| Column  | Type   | Options                        |
| ------- | ------ | ------------------------------ |
| user_id | bigint | null: false, foreign_key: true |
| pair_id | bigint | null: false, foreign_key: true |
| content | string |                                |
| image   | string |                                |

#### Association(messages)

- belongs_to :pair
- belongs_to :user
- has_many :notifications

### abouts Table

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| user_id        | bigint  | null: false, foreign_key: true |
| birthday       | date    | null: false                    |
| sex            | integer | null: false                    |
| nation_id      | integer | (active_hash)                  |
| body           | text    |                                |
| invitation     | string  |                                |
| recommendation | string  |                                |
| address        | string  |                                |
| latitude       | decimal | precision: 9, scale: 6         |
| longtitude     | decimal | precision: 10, scale: 6        |
| nowCountry     | string  |                                |
| nowCity        | string  |                                |

#### Association(abouts)

- belongs_to :user
- has_many :photos
- has_many :pictures
- belongs_to_active_hash :nation
- has_many :hangers

### photos Table

| Column   | Type   | Options                        |
| -------- | ------ | ------------------------------ |
| about_id | bigint | null: false, foreign_key: true |
| image    | string | null: false                    |

#### Association(photos)

- belongs_to :about

### pictures Table

| Column   | Type   | Options                        |
| -------- | ------ | ------------------------------ |
| about_id | bigint | null: false, foreign_key: true |
| image    | string | default: ""                    |

#### Association(pictures)

- belongs_to :about

### taggings Table

| Column        | Type    | Options                                      |
| ------------- | ------- | -------------------------------------------- |
| tag_id        | integer | null: false, unique: true, foreign_key: true |
| taggable_id   | integer | unique: true, polymorphic: true              |
| tagger_id     | integer | unique: true, polymorphic: true              |
| taggable_type | varchar | unique: true                                 |
| tagger_type   | varchar | unique: true                                 |
| context       | varchar | unique: true, limit: 128                     |

#### Association(taggings)

- belongs_to :about
- has_many :tags

### tags Table

| Column         | Type    | Options      |
| -------------- | ------- | ------------ |
| name           | varchar | unique: true |
| taggings_count | integer | default: 0   |

#### Association(tags)

- belongs_to :tagging

### hangers Table

| Column   | Type    | Options |
| -------- | ------- | ------- |
| about_id | integer |         |
| user_id  | integer |         |

#### Association(hangers)

- belongs_to :user
- belongs_to :about

### lessons Table

| Column  | Type   | Options |
| ------- | ------ | ------- |
| name    | string |         |
| proverb | text   |         |

#### Association(lessons)

### contacts Table

| Column  | Type   | Options                  |
| ------- | ------ | ------------------------ |
| name    | string | null: false              |
| cmail   | string | null: false, default: "" |
| title   | string | null: false              |
| content | text   | null: false              |

#### Association(contacts)

### notifications Table

| Column      | Type    | Options                     |
| ----------- | ------- | --------------------------- |
| visitor_id  | integer | null: false                 |
| visited_id  | integer | null: false                 |
| pair_id     | integer |                             |
| messagae_id | integer |                             |
| action      | string  | null: false, default: ""    |
| checked     | boolean | null: false, default: false |

#### Association(notifications)

- belongs_to :pair
- belongs_to :message
- belongs_to :visitor
- belongs_to :visited

---

## 著者

- 製作者：R.O.
- [GitHub](https://github.com/RYgithub1)
