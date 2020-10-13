# テーブル設計

## users テーブル

| Column                 | Type        | Options     |
| --------               | ------      | ----------- |
| zenkaku_familyname     | string      | null: false |
| zenkaku_name           | string      | null: false |
| katakana_family_kana   | string      | null: false |
| katakana-name_kana     | string      | null: false |
| email                  | string      | null: false |
| password               | string      | null: false |
| nickname               | string      | null: false |
| birthday               | date        | null: false |
has_many :items
has_many :orders
has_many :users_rooms
has_many :messages


## items テーブル

| Column         | Type        | Options                        |
| ------         | ----------  | ------------------------------ |
| name           | string      | null: false |
| info           | text        | null: false |
| category_id    | integer     | null: false |
| condition_id   | integer     | null: false |
| send_cost_id   | integer     | null: false |
| area_id        | integer     | null: false |
| deribary_id    | integer     | null: false |
| price          | integer     | null: false |
| user_id        | integer     | null: false,  foreign_key :true |
belongs_to :users
has_one :orders

## orders テーブル

| Column   | Type       | Options                        |
| -------  | ---------- | ------------------------------ |
| user_id  | integer    | null: false, foreign_key: true|
| item_id  | integer    | null: false, foreign_key: true|
belongs_to :users
belongs_to :items
has_one :address

## address テーブル

 | Column    | Type       | Options                       |
 | -------   | ---------- | ------------------------------ |
 | postcode  | string     | null: false |
 | area_id   | integer    | null: false |
 | cities    | string     | null: false |
 | number    | string     | null: false |
 | building  | string     |                                |
 | telephone | string     | null: false |
 belongs_to :order

 ## users_rooms テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| user_id       | integer    | null: false, foreign_key: true |
| room_id       | integer    | null: false, foreign_key: true |
belongs_to :users
belongs_to :rooms

## rooms テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| user_id       | integer    | null: false, foreign_key: true |
| title         | string     | null: false |
has_many :messages
has_many :users_rooms

## messages テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| user_id       | integer    | null: false, foreign_key: true |
| room_id       | integer    | null: false, foreign_key: true |
| talk          | text       | null: false |
belongs_to :users
belongs_to :rooms