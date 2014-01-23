class Place < ActiveRecord::Base
	geocoded_by :address

	after_validation :geocode



	validates :name, presence: true
	validates :address, presence: true

end
