## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| mail               | string | null: false, unique:true |
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

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| name        | string     | null: false |
| description | text       | null: false |
| category    | string     | null: false |
| condition   | string     | null: false |
| delivery    | string     | null: false |
| prefecture  | string     | null: false |
| ship        | string     | null: false |
| price       | integer    | null: false |
| user        | references | null: false, foreign_key: true |


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
| prefecture     | string     | null: false |
| city           | string     | null: false |
| street_address | string     | null: false |
| building       | string     |
| phone_number   | integer    | null: false |
| oder           | references | null: false, foreign_key: true |

### Association
- belongs_to :oder