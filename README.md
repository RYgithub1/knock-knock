# README

## トップイメージ

xxx

## アプリケーション名

_Knock-Knock!_
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

- リンク先
  - URL：http://xxx
- テストユーザー
  - メールアドレス：xxxx@xxxx
  - パスワード ：xxxxxxxx

## 内容

### アプリ遷移図

<img width="1185" alt="アプリ遷移図_20200707" src="https://user-images.githubusercontent.com/62828568/86683553-9e9ecf00-c03c-11ea-93fa-5e9b9ecc54e4.png">

#### トップページ(MAP)

マップの表示例
ログインポップ

#### トップページ(news)

ニュース表示例

#### プロフィール登録

#### 自分のプロフィール(About ME >トップ)

編集ボタン

#### 自分のプロフィール(About ME >現在地取得)

#### 他人のプロフィール(About HIM/HER >トップ)

ノック・ノックボタン

#### 他人のプロフィール(About HIM/HER >ハンガー)

#### ドア作成ページ(ドアノブチェック)

#### メッセージ交換ページ(Knock-Knock Door)

#### ドア一覧ページ(DoorS)

## 工夫

- マップ関係《MAP》

  - 現在地ボタンを１クリックするだけで位置を取得し、マップやポップアップに表示します。
  - マップ上で気になる旅人を選択しプロフィールに遷移可能です(要ログイン)。

- プロフィール関係《About / Hanger》

  - 自分のプロフィール編集ページ(About ME)で、複数画像をプレビュー確認し投稿できます。
  - 他人のプロフィール(About Him/Her)ページで、相手が気になる場合、ドアにハンガー(hanger)を非同期でかけられます。

- メッセージ関係《Knock-Knock Door / DoorS》
  - 同じアカウント同士(２人あたり)につき、メッセージ交換できるドア(Knock-Knock Door)は１つとしています。
  - ドア作成済みとハンガーかけ済みの状況を、一覧(DoorS)で、重複なく確認できます。

## 今後の実装予定

1. □ ノックノック操作音の追加
2. □ フッター項目の強化
3. □ 言語タグ検索の追加
4. □ ユーザー貢献度

## システム構成図

(デプロイに合わせ整備中)

---

## 開発環境

- Ruby（2.5.1）
- Rails（5.2.4.3）
- JavaScript
- jQuery（4.4.0）
- HTML/HAML
- CSS/SCSS
- Git（2.26.0）
- MySQL（5.6.47）
- AWS

## DB 設計

### ER 図

<img width="1258" alt="ER図_20200707" src="https://user-images.githubusercontent.com/62828568/86682462-9003e800-c03b-11ea-9885-7ff8a8a5eb2f.png">

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

#### Association(tags)

- belongs_to :user
- belongs_to :about

---

## 著者

- 製作者：R.O.
- [GitHub](https://github.com/RYgithub1)
