class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  with_options presence: true do
    validates :password, format: { with: VALID_PASSWORD_REGEX}
    validates :nickname
    validates :last_name, format: { with: VALID_NAME_REGEX }
    validates :first_name, format: { with: VALID_NAME_REGEX }
    validates :last_name_kana, format: { with: VALID_KANA_REGEX }
    validates :first_name_kana, format: { with: VALID_KANA_REGEX }
    validates :birth_date
  end

  has_many :items
  has_many :purchases
  
end
