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

  context '.book_info' do
    let(:author) {FactoryGirl.create(:author, id: 1, first_name: 'Dima')}
    let(:book){FactoryGirl.create(:book, author_id: 1, category_id: 1)}
    let(:category){FactoryGirl.create(:category, id: 1)}
    let(:search_result){search_result = book.book_info}
      xit "returns detailed book info" do
          expect{search_result.first_name}.not_to be_empty
      end

  end

  context '.decrease_in_stock' do
    let(:book1){FactoryGirl.create(:book, title: "Aaa", books_in_stock: 4)}
    it 'decreases books quantity by n books' do
      expect{book1.decrease_in_stock(1)}.to change{book1.books_in_stock}.from(4).to(3)
    end
  end

  context '.increase_in_stock' do
    let(:book2){FactoryGirl.create(:book, title: "Bbb", books_in_stock: 3)}
    it{expect{book2.increase_in_stock(1)}.to change{book2.books_in_stock}.from(3).to(4)}
  end

  context '.get_raiting' do
  end
end
