require 'spec_helper'
require 'shoulda-matchers'
describe Book do

  let(:book){FactoryGirl.create(:book)}

  context 'validations' do
    it{expect(book).to validate_presence_of(:title)}
    it{expect(book).to validate_numericality_of(:price).is_greater_than 0}
    it{expect(book).to validate_numericality_of(:books_in_stock).only_integer}
  end
  context 'associations' do
    it{expect(book).to belong_to(:category) }
    it{expect(book).to belong_to(:author) }
    it{expect(book).to have_and_belong_to_many(:order_items)}
  end

  context '#search_author' do
    let(:author) {FactoryGirl.create(:author, id: 1, first_name: 'Dima', last_name: 'Pansyn')}
    it "searches author belongs this book belongs to" do
      book1 = FactoryGirl.create(:book, author_id: author.id)
      expect(book1.search_author).to eq 'Dima'
    end
  end

end
