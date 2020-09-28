# テーブル設計

## users テーブル

| Column                 | Type        | Options     |
| --------               | ------      | ----------- |
| zenkaku-familyname     | string      | null: false |
| zenkaku-name           | string      | null: false |
| katakana-family-kana   | string      | null: false |
| katakana-name-kana     | string      | null: false |
| email                  | string      | null: false |
| password               | string      | null: false |
| nickname               | string      | null: false |
| birthday               | date        | null: false |
has_many :items
has_many :orders


## items テーブル

| Column         | Type        | Options                        |
| ------         | ----------  | ------------------------------ |
| name           | string      | null: false |
| text           | text        | null: false |
| category_id    | integer     | null: false |
| condition_id   | integer     | null: false |
| send_cost_id   | integer     | null: false |
| area_id        | integer     | null: false |
| date_id        | integer     | null: false |
| price          | integer     | null: false |
| user_id        | integer     | null: false,  foreign_key :true |
belongs_to :user
has_one :order

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
 | postcode  | string     | null: false |
 | states_id | integer    | null: false |
 | cities    | string     | null: false |
 | number    | string     | null: false |
 | building  | string     |                                |
 | telephone | string     | null: false |
 belongs_to :order