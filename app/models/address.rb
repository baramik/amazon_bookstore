class Address < ActiveRecord::Base
	belongs_to :country

  validates :address, presence: true
  validates :zipcode, presence: true, uniqueness: true
end
