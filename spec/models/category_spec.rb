require 'spec_helper'
require 'shoulda-matchers'

describe Category do
  let(:category){FactoryGirl.create(:category)}
  context "Associations" do
    it{expect(category).to have_many(:books)}
  end
  context "Validations" do
    it{expect(category).to validate_presence_of(:title)}
  end
end
