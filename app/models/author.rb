class Author < ActiveRecord::Base
	has_many :books
	validates :first_name, :last_name, presence: true, uniqueness: true 

	def number_books
		Book.where("author_id =?", self.id).count
	end
end

