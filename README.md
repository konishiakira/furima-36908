# README

# テーブル設計

## users テーブル

| Column             | Type   | Options              |
| ------------------ | ------ | -------------------- |
| email              | string | null: false          |
| encrypted_password | string | null: false          |
| name               | string | null: false          |
| birthday           | text   | null: false          |

### Association

- has_many :items
- has_one :buy_logs


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| product_name       | string     | null: false                    |
| p_image            | string     | null: false                    |
| p_explanation      | string     | null: false                    |
| category           | string     | null: false                    |
| p_status           | string     | null: false                    |
| shipping_charges   | string     | null: false                    |
| shipping_area      | string     | null: false                    |
| delivery_date_days | date       | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
### Association

- has_one :buy_logs
- belongs_to :users


## sends テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | string     | null: false,                   |
| city          | string     | null: false,                   |
| city_address  | string     | null: false,                   |
| building_name | string     | null: false,                   |
| send_tel      | integer    | null: false,                   |


### Association

- has_one :buy_logs

## buy_logs テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |
| send            | references | null: false, foreign_key: true |


### Association

- belongs_to :items
- belongs_to :sends
- belongs_to :users