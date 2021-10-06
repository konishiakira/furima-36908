# README

# テーブル設計

## users テーブル

| Column             | Type   | Options              |
| ------------------ | ------ | -------------------- |
| email              | string | null: false,includes |
| encrypted_password | string | null: false          |
| nickname           | string | null: false          |
| f_name             | string | null: false          |
| l_name             | string | null: false          |
| f_name_f           | string | null: false          |
| l_name_f           | string | null: false          |
| birthday           | date   | null: false          |


### Association

- has_many :items
- has_many :buy_logs


## items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| product_name          | string     | null: false                    |
| p_explanation         | text       | null: false                    |
| category_id           | numeric    | null: false                    |
| p_status_id           | numeric    | null: false                    |
| shipping_charges_id   | numeric    | null: false                    |
| shipping_area_id      | numeric    | null: false                    |
| delivery_date_days_id | numeric    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |


### Association

- has_one :buy_logs
- belongs_to :users


## sends テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| city_address  | string     | null: false                    |
| building_name | string     | null: false                    |
| send_tel      | string     | null: false                    |
| buy_log       | references | null: false, foreign_key: true |


### Association

- belongs_to :buy_log

## buy_logs テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- has_one :send
- belongs_to :user