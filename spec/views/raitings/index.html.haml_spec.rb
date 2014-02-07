require 'spec_helper'

describe "raitings/index" do
  before(:each) do
    assign(:raitings, [
      stub_model(Raiting),
      stub_model(Raiting)
    ])
  end

  it "renders a list of raitings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
