class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true
  validates :birthday, presence: true

  with_options presence: true do
    validates :password, format: { with: /\A[a-zA-Z0-9]+\z/ , message: "は半角英数で入力してください。"}
    validates :zenkaku_familyname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
    validates :zenkaku_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
    validates :katakana_family_kana, format: { with:/\A[ァ-ヶー－]+\z/, message: "は全角（カタカナ）で入力してください。"}
    validates :katakana_name_kana, format: { with:/\A[ァ-ヶー－]+\z/, message:"は全角（カタカナ）で入力してください。"}
  end
end
