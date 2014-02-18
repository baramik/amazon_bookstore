require 'spec_helper'

describe Raiting do
  describe Raiting do
    let(:raiting) { FactoryGirl.create :raiting }
    context 'Validations' do
      it{expect(raiting).to ensure_inclusion_of(:raiting_number).in_range(1..5)}
    end
    context 'Associations' do
      it{expect(raiting).to belong_to(:book)}
      it{expect(raiting).to belong_to(:customer)}
    end
    it "allows to rate" do
      expect(FactoryGirl.build :raiting).to be_valid
    end
  end
end
