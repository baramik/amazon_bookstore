class Author < ActiveRecord::Base
	has_many :books
	validates :first_name, :last_name, presence: true, length: {minimum: 3}

	def number_of_books
    Book.by_author(self.id).count
	end
end

