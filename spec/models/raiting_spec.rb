require 'spec_helper'

describe Raiting do
  describe Raiting do
    let(:raiting) { FactoryGirl.create :rating }
    context 'Validations' do
      it{expect(rating).to ensure_inclusion_of(:rating).in_range(1..5)}
    end
    context 'Associations' do
      it{expect(rating).to belong_to(:book)}
      it{expect(rating).to belong_to(:customer)}
    end
    it "allows to rate" do
      expect(FactoryGirl.build :rating).to be_valid
    end
  end
end
