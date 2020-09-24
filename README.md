# テーブル設計

## users テーブル

| Column   | Type        | Options     |
| -------- | ------      | ----------- |
| zenkaku-familyname     | string | null: false |
| zenkaku-name           | string | null: false |
| katakana-family-kana   | string | null: false |
| katakana-name-kana     | string | null: false |
| email    | string      | null: false |
| password | string      | null: false |
| nickname | string      | null: false |
| birthday | date        | null: false |
has_many :item


## items テーブル

| Column         | Type        | Options                        |
| ------         | ----------  | ------------------------------ |
| name           | string      | null: false |
| text           | string      | null: false |
| category_id    | integer     | null: false |
| condition_id   | integer     | null: false |
| send-cost_id   | integer     | null: false |
| area_id        | integer     | null: false |
| date_id        | integer     | null: false |
| price          | integer     | null: false |
belongs_to :user

## order テーブル

| Column   | Type       | Options                        |
| -------  | ---------- | ------------------------------ |
| user_id  | integer    | null: false, foreign_key: true|
| item_id  | integer    | null: false, foreign_key: true|
belongs_to :user
belongs_to :item
has_one :address

## address テーブル

 | Column    | Type       | Options                       |
 | -------   | ---------- | ------------------------------ |
 | postcode  | integer    | null: false |
 | states_id | string     | null: false |
 | cities    | string     | null: false |
 | number    | string     | null: false |
 | building  | string     |                                |
 | telephone | integer    | null: false |
 belongs_to :order