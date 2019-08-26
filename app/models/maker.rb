class Maker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :validatable
	has_many :items
	has_many :shops
	attachment :image

	geocoded_by :street_address
	after_validation :geocode

end
