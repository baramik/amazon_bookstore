class Credit_Card < ActiveRecord::Base
	belongs_to :customer
	has_many :orders
	
	validates :number, length: {is: 16}
	validates :CVV, length: {minimum: 3,maximum: 4}
	validates :number, :CVV, numericality: {only_integer: true}
	validates :number, uniqueness: true, presence: true
	validates :CVV, :expiration_month, :expiration_year, presence: true	
	validates :expiration_year, length: {is: 4}
	validates :expiration_month, inclusion: {is: 1..12}
end
