## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth              | date   | null: false               |

### Association
- has_many :items
- has_many :orders


## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | string     | null: false                    |
| item_name     | string     | null: false                    |
| description   | text       | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| shipping      | string     | null: false                    |
| region        | string     | null: false                    |
| delivery_time | string     | null: false                    |
| price         | string     | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postcode     | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| block        | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| order_id     | references | null: false, foreign_key: true |

### Association
- belongs_to :order