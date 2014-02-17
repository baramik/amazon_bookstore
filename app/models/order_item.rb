class OrderItem < ActiveRecord::Base
	belongs_to :book
	belongs_to :order

	validates :price, :quantity, presence: true
	validates :quantity, numericality: {only_integer: true}

  before_save :count_total_price

	def count_total_price
    self.price = (book.price * self.quantity).to_f
  end

  def decrease_quantity num
		self.quantity -= num
		save!
	end

	def increase_quantity num
		self.quantity += num
		save!
  end

  def return_to_stock num
     book.books_in_stock += num
  end

  def take_from_stock num
    book.books_in_stock -= num
  end

end

