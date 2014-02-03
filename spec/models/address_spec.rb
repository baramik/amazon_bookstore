require 'spec_helper'
require 'shoulda-matchers'

describe Address do
  let(:address) {FactoryGirl.create :address}
    context 'validations' do
      it {expect(address).to validate_presence_of(:address)}
      it {expect(address).to validate_presence_of(:zipcode)}
      it {expect(address).to validate_uniqueness_of(:zipcode)}
    end
    context 'associations' do
      it {expect(address).to belong_to(:country)}
    end
end
