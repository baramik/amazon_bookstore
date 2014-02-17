require 'spec_helper'
require 'shoulda-matchers'

describe OrderItem do
  let(:book){FactoryGirl.create(:book)}
  let(:order_item){FactoryGirl.create(:order_item, book: book)}
  context 'validations' do
    it{expect(order_item).to validate_presence_of(:price)}
    it{expect(order_item).to validate_presence_of(:quantity)}
  end

  context 'associations' do
    it{expect(order_item).to belong_to(:order)}
    it{expect(order_item).to belong_to(:book)}
  end

  let(:order_item_instance){FactoryGirl.build(:order_item, book: book)}

  context '.count_total_price' do
      it {expect{order_item_instance.count_total_price}.to change{order_item_instance.price}.to 50.00 }
      it 'should count sum of books in order item before save' do
        expect(order_item_instance).to receive(:count_total_price)
        order_item_instance.save!
      end
  end

  context '.decrease_quantity' do
    it {expect{order_item_instance.decrease_quantity(2)}.to change{order_item_instance.quantity}.from(5).to(3)}
  end
  context '.increase_quantity' do
    it {expect{order_item_instance.increase_quantity(2)}.to change{order_item_instance.quantity}.from(5).to(7)}
  end

  context '.return_to_stock' do
    let(:saved_order_item){FactoryGirl.create(:order_item, book: book)}
    it 'returns book to stock after destroying order' do
      expect{saved_order_item.return_to_stock 7}.to change{book.books_in_stock}.from(500).to(507)
    end
  end

  context '.take_from_stock' do
    let(:saved_order_item){FactoryGirl.create(:order_item, book: book)}
    it 'takes book from_stock in case of adding it to order_item' do
       expect{saved_order_item.take_from_stock(7)}.to change{book.books_in_stock}.from(500).to(493)
    end
  end
end
