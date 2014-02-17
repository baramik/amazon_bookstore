class Raiting < ActiveRecord::Base
	belongs_to :customer
	belongs_to :book

  scope :rate_sum, -> (book){sum(:raiting_number).where('book_id = ?', book)}
  scope :rate_count, -> (book){count(:raiting_number).where('book_id = ?', book)}

  validates :raiting_number, presence: true, inclusion: {in: 1..5}


  def set_rate_approved
    self.status = true
  end

end



