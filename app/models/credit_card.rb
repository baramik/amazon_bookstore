class CreditCard < ActiveRecord::Base
	belongs_to :customer
	has_many :orders
  validates :number, format: {with: /\A[0-9]{16}\z/, message: 'card number should contain 16 digits'}
	validates :CVV, length: {in: 3..4}
	validates :CVV, numericality: {only_integer: true}
	validates :number, uniqueness: true, presence: true
	validates :CVV, :expiration_month, :expiration_year, presence: true	
	validates :expiration_year, length: {is: 2}
	validates :expiration_month, inclusion: {in: 1..12}
end
