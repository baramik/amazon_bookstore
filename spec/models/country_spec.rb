require 'spec_helper'
require 'shoulda-matchers'

describe Country do
  let(:country){FactoryGirl.create(:country)}
  context 'Validations' do
    it{expect(country).to validate_uniqueness_of(:name)}
  end
  context 'Associations' do
    it{expect(country).to have_many(:addresses)}
  end
end
