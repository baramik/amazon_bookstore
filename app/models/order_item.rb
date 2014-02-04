class OrderItem < ActiveRecord::Base
	belongs_to :book
	belongs_to :order

  has_and_belongs_to_many :books

	validates :price, :quiantity, presence: true 
	validates :quiantity, numericality: {only_integer: true}

	def decrease_quantity num
		self.quiantity -= num
		save!
	end

	def increase_count num
		self.quiantity += num
		save!
 	end
end

