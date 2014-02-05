require 'spec_helper'
require 'shoulda-matchers'

describe Author do

let(:author){FactoryGirl.create(:author, id: 1)}

  context 'validations' do
    it{expect(author).to validate_presence_of(:first_name)}
    it{expect(author).to validate_presence_of(:last_name)}
    it{expect(author).to ensure_length_of(:first_name).is_at_least(3)}
    it{expect(author).to ensure_length_of(:last_name).is_at_least(3)}

  end

  context 'associations' do
    it {expect(author).to have_many(:books)}
  end

  before(:each) do
    @book1 = FactoryGirl.create(:book, title: "Barabushka", author_id: author.id)
    @book2 = FactoryGirl.create(:book, title: "Babushka", author_id: author.id)
  end

  context '#number_books' do
    it 'should get authors of book' do
        expect(author.number_of_books).to eq(2)
    end
  end
end
