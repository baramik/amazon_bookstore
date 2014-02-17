require 'spec_helper'
require 'shoulda-matchers'

describe Customer do
  let(:customer){FactoryGirl.create(:customer)}
  context 'Associations' do
    it{expect(customer).to have_many(:orders)}
    it{expect(customer).to have_many(:credit_cards)}
  end
  context 'Validations' do
    it{expect(customer).to validate_uniqueness_of(:email)}
  end

  it 'Calls set_default_user_type after save User' do
    unsaved_user = FactoryGirl.build(:customer)
    expect(unsaved_user).to receive(:set_default_user_type)
    unsaved_user.save!
  end
  context '.orders_history' do
    xit 'should include all clients orders' do
      let(:order){FactoryGirl.create(:order, state: 'rejected')}
      let(:client_with_order){FactoryGirl.create(:customer, order: order)}
      expect{customer.orders_history}.not_to be_empty
    end

  end
end
