class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :validatable
    attachment :image

    has_many :items, through: :commets
    has_many :comments, dependent: :destroy
    has_many :favorites, dependent: :destroy

	validates :name, presence: true
	validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー一-龠]+\z/, message: "全角文字のみが使用できます" }
	validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー一-龠]+\z/, message: "全角文字のみが使用できます" }
	validates :last_name_katakana, presence: true, format: { with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/, message: "全角カタカナのみが使用できます" }
	validates :first_name_katakana, presence: true, format: { with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/, message: "全角カタカナのみが使用できます" }
	validates :street_address, presence: true
	validates :postal_code, presence: true, format: { with: /\A[0-9]+\z/, message: "半角数字のみが使用できます" }
	validates :phone_number, presence: true, length: { maximum: 11 }
  end