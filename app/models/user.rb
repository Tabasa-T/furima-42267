class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  VALID_ZENKAKU_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー－]+\z/
  VALID_KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は英字と数字の両方を含めて設定してください' }
  validates :nickname, presence: true
  validates :family_name, presence: true, format: { with: VALID_ZENKAKU_REGEX, message: 'は全角文字で入力してください' }
  validates :first_name, presence: true, format: { with: VALID_ZENKAKU_REGEX, message: 'は全角文字で入力してください' }
  validates :family_name_kana, presence: true,  format: { with: VALID_KATAKANA_REGEX, message: 'は全角カタカナで入力してください' }
  validates :first_name_kana, presence: true,  format: { with: VALID_KATAKANA_REGEX, message: 'は全角カタカナで入力してください' }
  validates :birthday, presence: true
end
