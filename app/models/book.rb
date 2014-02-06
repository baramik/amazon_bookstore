class Book < ActiveRecord::Base
	belongs_to :category
	belongs_to :author
  has_many :order_items
	has_many :raitings

	validates :title, presence: true, uniqueness: true
	validates :price, numericality: {greater_than: 0}
	validates :books_in_stock, numericality: {only_integer: true}

	def search_author
		Author.where('id = ?', self.author_id)
	end

	def decrease_in_stock(num)
		self.books_in_stock -= num
		save!
	end

	def increase_in_stock(num)
		self.books_in_stock += num
		save!
	end

	def book_instock_count(id)
		self.sum(:books_in_stock).where('id = ?', id)	
	end

	def get_raiting(id)
		rate = Raiting.sum(:raiting_number).where('book_id = ?', id)
		rate_count = Raiting.count(:raiting_number).where('book_id = ?', id)
		total_rate = rate / rate_count unless rate.empty? && rate_count.empty?
	end

end

