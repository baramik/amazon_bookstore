require 'spec_helper'
require 'shoulda-matchers'
describe Book do

  let(:book){FactoryGirl.create(:book)}

  context 'validations' do
    it{expect(book).to validate_presence_of(:title)}
    it{expect(book).to validate_uniqueness_of(:title)}
    it{expect(book).to validate_numericality_of(:price).is_greater_than 0}
    it{expect(book).to validate_numericality_of(:books_in_stock).only_integer}
  end
  context 'associations' do
    it{expect(book).to belong_to(:category) }
    it{expect(book).to belong_to(:author) }
    it{expect(book).to have_many(:order_items)}
  end

  before {@author = FactoryGirl.create(:author, id: 1, first_name: 'Dima')}
  context '#search_author' do
    #let(:author) {FactoryGirl.create(:author, id: 1, first_name: 'Dima')}
    it "searches author belongs this book belongs to" do
      book1 = FactoryGirl.create(:book, author_id: @author.id)
      search_result = book1.search_author
      expect(search_result).not_to be_empty
    end
  end

  let(:books){FactoryGirl.create(:book, books_in_stock: 3)}
  context '#decrease_in_stock' do
    it 'decreases books quantity by n books' do

    end
  end

  context '#increase_in_stock' do
      it{expect{books.increase_in_stock(1)}.to change{books.books_in_stock}.from(3).to(4)}
  end

  context '#book_instock_count' do

  end

  context '#get_raiting' do

  end
end
