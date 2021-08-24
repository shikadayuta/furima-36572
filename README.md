# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| name               | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | date    | null: false |

### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
|user                 | references | null: false, foreign_key: true |
|name                 | string     | null: false                    |
|info                 | text       | null: false                    |
|category             | string     | null: false                    |
|sales_status         | string     | null: false                    |
|shipping_fee_status  | string     | null: false                    |
|prefecture           | string     | null: false                    | 
|scheduled_delivery   | string     | null: false                    |
|price                | integer    | null: false                    |


### Association

- has_one :purchase
- belongs_to :user

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :destination

## destinations テーブル

| Column       | Type    | Options     |
| ------------ | ------  | ----------- |
| postal_code  | integer | null: false |
| prefecture   | string  | null: false |
| city         | string  | null: false |
| addresses    | string  | null: false |
| phone number | string  | null: false |


### Association

- belongs_to :purchase

