require 'spec_helper'

describe "raitings/show" do
  before(:each) do
    @raiting = assign(:raiting, stub_model(Raiting))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
