# README

---

## トップイメージ

xxx

## アプリケーション名

Knock-Knock!
（ノック・ノック！：旅人を探して情報交換するアプリ）

## 概要

マップ上で気になった旅人を選んで、旅やプライベートな内容についての相談や情報交換ができるアプリケーションです。

## 製作背景

海外を旅していた際に、次の目的地の「最新の治安状態」や「おすすめアクティビティ」を知りたい事が何度もありました。
現状最適なツールが見当たらず、旅人同士は現地であった人と情報交換する事が多いです。
最新の生きた情報を、もっと手軽により早く入手できれば、より安全で、満足度が高い体験をできるを考え製作しました。

---

## 本番環境

デプロイ中になります。

1. リンク先
   1-1. URL：http://xxx
2. テストユーザー
   2-1. メールアドレス：xxxx@xxxx
   2-2. パスワード ：xxxxxxxx

## 内容

#### トップページ(MAP)

#### 自分のプロフィール(About ME)

#### 他人のプロフィール(About HIM/HER)

#### ドア作成ページ

#### メッセージ交換ページ(Knock-Knock Door)

#### ドア一覧ページ(DoorS)

## 工夫

1. マップ関係《MAP》
   1-1. 取得ボタンを押下するだけで、非同期で現在位置を取得し、マップに反映できます。
   1-2. マップ上で気になる旅人を選択しプロフィールに遷移可能です。
2. プロフィール関係《About / Hanger》
   2-1. 自分のプロフィール編集ページで、複数画像をプレビュー表示で確認し投稿できます。
   2-2. 他人のプロフィール(about)ページで、お気に入りのドアにハンガー(hanger)を非同期でかけられます。
3. メッセージ関係《Knock-Knock Door / DoorS》
   3-1. 同じアカウント(２つ)につき、メッセージ交換できるドア(Knock-Knock Door)は１つとしています。
   3-2. ドア作成済みとハンガーかけ済みの状況を、一覧で、重複なく確認できるようにしています。

## 今後の実装予定

1. □ 新着メッセージ有無の判別機能
2. □ 操作時のノックノック音機能
3. □ フッター項目
4. □ 現地時間表示
5. □ 評価機能

---

## 開発環境

- Ruby
  - 2.5.1
- Rails
  - 5.2.4.3
- JavaScript/jQuery
- HTML/HAML
- CSS/SCSS
- Git
  - 2.26.0
- MySQL
  - 5.6.47
- AWS

## DB 設計

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

### users_pairs Table

| Column  | Type    | Options           |
| ------- | ------- | ----------------- |
| user_id | integer | foreign_key: true |
| pair_id | integer | foreign_key: true |

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

### messages Table

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| pair_id | integer | null: false, foreign_key: true |
| content | string  |                                |
| image   | string  |                                |

#### Association(messages)

- belongs_to :user
- belongs_to :pair

### abouts Table

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| user_id        | integer | null: false, foreign_key: true |
| birthday       | date    | null: false                    |
| sex            | integer | null: false                    |
| nation_id      | integer | (active_hash)                  |
| body           | text    |                                |
| invitation     | string  |                                |
| recommendation | string  |                                |
| address        | string  |                                |
| latitude       | decimal | precision: 9, scale: 6         |
| longtitude     | decimal | precision: 10, scale: 6        |

#### Association(abouts)

- belongs_to :user
- has_many :photos
- has_many :pictures
- belongs_to_active_hash :nation
- has_many :hangers

### photos Table

| Column   | Type    | Options                        |
| -------- | ------- | ------------------------------ |
| about_id | integer | null: false, foreign_key: true |
| image    | string  | null: false                    |

#### Association(photos)

- belongs_to :about

### pictures Table

| Column   | Type    | Options                        |
| -------- | ------- | ------------------------------ |
| about_id | integer | null: false, foreign_key: true |
| image    | string  | default: ""                    |

#### Association(pictures)

- belongs_to :about

### taggings Table

| Column        | Type    | Options                                      |
| ------------- | ------- | -------------------------------------------- |
| tag_id        | integer | null: false, unique: true, foreign_key: true |
| taggable_id   | integer | unique: true, polymorphic: true              |
| tagger_id     | integer | unique: true, polymorphic: true              |
| taggable_type | string  | unique: true                                 |
| tagger_type   | string  | unique: true                                 |
| context       | string  | unique: true, limit: 128                     |

#### Association(taggings)

- belongs_to :about
- has_many :tags

### tags Table

| Column         | Type    | Options      |
| -------------- | ------- | ------------ |
| name           | string  | unique: true |
| taggings_count | integer | default: 0   |

#### Association(tags)

- belongs_to :tagging

## 補足

### アプリ遷移図

### ER 図

### システム構成図

### 著者

---
