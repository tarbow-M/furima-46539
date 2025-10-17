class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 空欄禁止
  validates :nickname, presence: true
  validates :birthday, presence: true

  # パスワードに半角英字と数字の両方を含むバリを追加
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: PASSWORD_REGEX, message: 'は半角英字と数字の両方を含めて設定してください' }, on: :create

  # 姓・名に空欄禁止＋全角文字のみ許可するバリを追加
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  # 姓・名カナ入力に空欄禁止＋全角カナ文字のみ許可するバリを追加
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角カタカナを使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end
end
