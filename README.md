# README

## usersテーブル

|Column            |Type  |Options                   |
|------------------|------|--------------------------|
|nickname          |string|null: false               |
|email             |string|null: false, unique: true|
|encrypted_password|string|null: false               |
|family_name       |string|null: false               |
|first_name        |string|null: false               |
|family_name_kana  |string|null: false               |
|first_name_kana   |string|null: false               |
|birthday          |date  |null: false               |

### Association
- has_many :items
- has_many :orders


## itemsテーブル

|Column            |Type      |Options                       |
|------------------|----------|------------------------------|
|name              |string    |null: false                   |
|description       |text      |null: false                   |
|price             |integer   |null: false                   |
|category_id       |integer   |null: false                   |
|condition_id      |integer   |null: false                   |
|shipping_burden_id|integer   |null: false                   |
|prefecture_id     |integer   |null: false                   |
|shipping_day_id   |integer   |null: false                   |
|user              |references|null: false, foreign_key: true|

### Association
- has_one :order
- belongs_to :user

## ordersテーブル

|Column |Type      |Options                       |
|-------|----------|------------------------------|
|user   |references|null: false, foreign_key: true|
|item   |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## shipping_addressテーブル

|Column       |Type      |Options                       |
|-------------|----------|------------------------------|
|order        |references|null: false, foreign_key: true|
|postal_code  |string    |null: false                   |
|prefecture_id|integer   |null: false                   |
|city         |string    |null: false                   |
|address      |string    |null: false                   |
|building_name|string    |                              |
|phone_number |string    |null: false                   |

### Association

- belongs_to :order