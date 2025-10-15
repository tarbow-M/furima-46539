## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| mail               | string | null: false, unique:true |
| encrypted_password | string | null: false, unique:true |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |

### Association
- have_many :items
- have_many :orders


## Itemsテーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| name        | string     | null: false |
| description | text       | null: false |
| price       | integer    | null: false |
| user        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## Ordersテーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| city         | string     | null: false |
| addresses    | string     | null: false |
| building     | string     |
| phone_number | integer    | null: false |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association
- belongs_to :group
- belongs_to :user