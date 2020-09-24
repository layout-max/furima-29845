# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| nickname | string | null: false |
| birthday | string | null: false |
has_to :item
has_to :user


## items テーブル

| Column      | Type       | Options                        |
| ------      | ---------- | ------------------------------ |
| name        | references | null: false, foreign_key: true |
| image       | references | null: false, foreign_key: true |
| text        | references | null: false, foreign_key: true |
| category    | references | null: false, foreign_key: true |
| condition   | references | null: false, foreign_key: true |
| send-cost   | references | null: false, foreign_key: true |
| area        | references | null: false, foreign_key: true |
| date        | references | null: false, foreign_key: true |
| price       | references | null: false, foreign_key: true |
belongs_to :user

## order テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| card    | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |
belongs_to :user
belongs_to :item