# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| nickname           | string | null: false              |
| f_name             | string | null: false              |
| l_name             | string | null: false              |
| f_name_f           | string | null: false              |
| l_name_f           | string | null: false              |
| birthday           | date   | null: false              |


### Association

- has_many :items
- has_many :buylogs


## items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| productname          | string     | null: false                    |
| p_explanation         | text       | null: false                    |
| category_id           | integer    | null: false                    |
| pstatus_id            | integer    | null: false                    |
| shippingcharges_id   | integer    | null: false                    |
| shippingarea_id      | integer    | null: false                    |
| deliverydatedays_id | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |


### Association

- has_one :buylog
- belongs_to :user


## itemsends テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postalcode    | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| cityaddress   | string     | null: false                    |
| buildingname  | string     |                                |
| sendtel       | string     | null: false                    |
| buylog        | references | null: false, foreign_key: true |


### Association

- belongs_to :buylog

## buylogs テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- has_one :itemsend
- belongs_to :user