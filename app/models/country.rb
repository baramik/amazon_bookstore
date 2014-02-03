class Country < ActiveRecord::Base
  has_many :addresses
	validates :name, uniqueness: true, presence: true
end
