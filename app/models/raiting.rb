class Raiting < ActiveRecord::Base
	belongs_to :customer
	belongs_to :book

	validates :raiting_number, presence: true, inclusion: {in: 1..5} 
end



