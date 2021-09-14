class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birth_date, presence: true

  validates :last_name, presence: true
  validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'is invalid. Input full-width characters' }, if: lambda { |u|
                                                                                                                         u.last_name.present?
                                                                                                                       }

  validates :first_name, presence: true
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'is invalid. Input full-width characters' }, if: lambda { |u|
                                                                                                                          u.first_name.present?
                                                                                                                        }

  validates :last_name_kana, presence: true
  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' }, if: lambda { |u|
                                                                                                                                  u.last_name_kana.present?
                                                                                                                                }

  validates :first_name_kana, presence: true
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' }, if: lambda { |u|
                                                                                                                                   u.first_name_kana.present?
                                                                                                                                 }
  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Include both letters and numbers' }, if: lambda { |u|
                                                                                                                                   u.password.present?
                                                                                                                                 }
  has_many :items
  has_many :orders
end
