require 'spec_helper'
require 'shoulda-matchers'
describe Shipment do
  context 'associations' do
    it{expect(:shipment).to belong_to(:orders) }
  end
end
