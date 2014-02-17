class Book < ActiveRecord::Base
	belongs_to :category
	belongs_to :author
  has_many :order_items
	has_many :raitings

	validates :title, presence: true, uniqueness: true
	validates :price, numericality: {greater_than: 0}
	validates :books_in_stock, numericality: {only_integer: true}

  scope :in_stock, ->{where("in_stock > 0")}
  scope :by_author, ->(author){where("author_id = ?", author)}
  scope :by_category, ->(category){where("category_id = ?", category )}
  scope :detailed_information, ->(book){joins(:author, :category).where('books.id = ?', book)} #detailed information about book

  def book_info
    self.detailed_information(self.id)
  end

  def decrease_in_stock(num)
		self.books_in_stock -= num
		save!
	end

	def increase_in_stock(num)
		self.books_in_stock += num
		save!
	end

	def get_raiting(book)
		rate_sum = Raiting.rate_sum(book)
		rate_count = Raiting.rate_count(book)
		total_rate = rate_sum / rate_count unless rate_sum.empty? && rate_count.empty?
	end
end

