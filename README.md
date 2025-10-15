## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

### Association
- have_many :items
- have_many :orders


## Itemsテーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| name          | string     | null: false |
| description   | text       | null: false |
| category_id   | integer    | null: false |
| condition_id  | integer    | null: false |
| delivery_id   | integer    | null: false |
| prefecture_id | integer    | null: false |
| ship_id       | integer    | null: false |
| price         | integer    | null: false |
| user          | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :order


## Ordersテーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## Addressesテーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| postal_code    | string     | null: false |
| prefecture_id  | integer    | null: false |
| city           | string     | null: false |
| street_address | string     | null: false |
| building       | string     |
| phone_number   | integer    | null: false |
| order          | references | null: false, foreign_key: true |

### Association
- belongs_to :order