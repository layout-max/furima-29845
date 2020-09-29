class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true
  validates :birthday, presence: true

Z = /\A[ぁ-んァ-ン一-龥]/
HE = /\A[a-zA-Z0-9]+\z/
ZK = /\A[ァ-ヶー－]+\z/
HEO = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

  with_options presence: true do
    validates :password, format: { with: HEO, message: "は半角英数で入力してください。"}
    validates :zenkaku_familyname, format: { with: Z, message: "は全角で入力してください。"}
    validates :zenkaku_name, format: { with: Z, message: "は全角で入力してください。"}
    validates :katakana_family_kana, format: { with:ZK, message: "は全角（カタカナ）で入力してください。"}
    validates :katakana_name_kana, format: { with:ZK, message:"は全角（カタカナ）で入力してください。"}
  end
end