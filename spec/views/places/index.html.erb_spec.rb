require 'rails_helper'

RSpec.describe "places/index", type: :view do
  before(:each) do
    assign(:places, [
      Place.create!(
        :name => "Name",
        :longitude => 2.5,
        :latitude => 3.5
      ),
      Place.create!(
        :name => "Name",
        :longitude => 2.5,
        :latitude => 3.5
      )
    ])
  end

  it "renders a list of places" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
  end
end
