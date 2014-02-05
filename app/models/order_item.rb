class OrderItem < ActiveRecord::Base
	belongs_to :book
	belongs_to :order

	validates :price, :quiantity, presence: true 
	validates :quiantity, numericality: {only_integer: true}

	def order_item_total_price

  end


  def decrease_quantity num
		self.quiantity -= num
		save!
	end

	def increase_count num
		self.quiantity += num
		save!
 	end
end

