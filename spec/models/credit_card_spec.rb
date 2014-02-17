require 'spec_helper'
require 'shoulda-matchers'

describe CreditCard do
 let(:credit_card){FactoryGirl.create(:credit_card, CVV: 1234)}
  context 'Validations' do
    it{expect(credit_card).to ensure_length_of(:number)}
    it{expect(credit_card).to ensure_length_of(:CVV)}
    it{expect(credit_card).to validate_uniqueness_of(:number)}
    it{expect(credit_card).to validate_numericality_of(:CVV)}
    it{expect(credit_card).to validate_presence_of(:number)}
    it{expect(credit_card).to ensure_length_of(:expiration_year)}
    it{expect(credit_card).to ensure_length_of(:expiration_month)}
  end

 context 'Associations' do
    it{expect(credit_card).to belong_to(:customer)}
    it{expect(credit_card).to have_many(:orders)}
 end
end
