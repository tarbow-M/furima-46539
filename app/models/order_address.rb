class OrderAddress
  include ActiveModel::Model
  # 保存したいテーブルのカラム名 + クレジットカードのトークンをここに記述
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :street_address, :building, :phone_number, :token

  # バリデーションをここにまとめる
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code
    validates :city
    validates :street_address
    validates :phone_number
    validates :token # カード情報のトークン
  end

  # 郵便番号の形式を検証（存在する場合のみ）
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }, allow_blank: true
  # 都道府県の選択が「---」でないことを検証
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  # 電話番号を半角10桁以上11桁以内に制限
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }, allow_blank: true

  def save
    # トランザクション処理により、どちらかの保存に失敗した場合は両方ともロールバック(無かったことになる)
    ActiveRecord::Base.transaction do
      # 注文情報を保存し、変数orderに代入する
      order = Order.create(user_id: user_id, item_id: item_id)
      # 住所を保存する
      # order_idには、今作成したorderのidを指定する
      Address.create(
        postal_code: postal_code,
        prefecture_id: prefecture_id,
        city: city,
        street_address: street_address,
        building: building,
        phone_number: phone_number,
        order_id: order.id
      )
    end
  end
end
