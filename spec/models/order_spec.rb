require 'spec_helper'
require 'shoulda-matchers'
describe Order do
  let(:order){FactoryGirl.create(:order)}
  context 'Validations' do
    it{expect(order).to validate_numericality_of(:total_price)}
    it{expect(order).to ensure_inclusion_of(:state).in_array(%W(in_progress in_queue in_delivery delivered rejected))}
  end

  context 'Associations' do
    it {expect(order).to belong_to(:customer)}
    it {expect(order).to have_one(:credit_card)}
    it {expect(order).to have_one(:ship_address).class_name('Address')}
    it {expect(order).to have_one(:bill_address).class_name('Address')}
    it {expect(order).to have_many(:order_items).dependent(:destroy)}
    it {expect(order).to have_one(:shipment)}
  end

  context '.' do

  end
end

