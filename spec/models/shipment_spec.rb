require 'spec_helper'
require 'shoulda-matchers'
describe Shipment do

  let(:shipment){FactoryGirl.create(:shipment)}
  context 'associations' do
    it{expect(shipment).to belong_to(:order) }
  end
end
