# テーブル設計

## users テーブル

| Column           | Type    | Options                   |
| ---------------- | ------- | ------------------------- |
| nickna           | string  | null: false               |
| email            | string  | null: false, unique: true |
| password         | string  | null: false               |
| family_name      | string  | null: false               |
| first_name       | string  | null: false               |
| family_name_kana | string  | null: false               |
| first_name_kana  | string  | null: false               |
| birth_year       | integer | null: false               |
| birth_month      | integer | null: false               |
| birth_day        | integer | null: false               |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_name    | string     | null: false                    |
| content      | text       | null: false                    |
| category     | string     | null: false                    |
| condition    | string     | null: false                    |
| delivery_fee | string     | null: false                    |
| ship_area    | string     | null: false                    |
| ship_day     | string     | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true | 

### Association

- belongs_to :users
- has_one :purchase


## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| date   | integer    | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | integer    | null: false                    |
| prefecture     | string     | null: false                    |
| city_town      | string     | null: false                    |
| address_number | string     | null: false                    |
| building       | string     |                                |
| phone_number   | integer    | null: false                    |
| purchases      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase