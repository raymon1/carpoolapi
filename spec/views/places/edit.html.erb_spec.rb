require 'rails_helper'

RSpec.describe "places/edit", type: :view do
  before(:each) do
    @place = assign(:place, Place.create!(
      :name => "MyString",
      :longitude => 1.5,
      :latitude => 1.5
    ))
  end

  it "renders the edit place form" do
    render

    assert_select "form[action=?][method=?]", place_path(@place), "post" do

      assert_select "input#place_name[name=?]", "place[name]"

      assert_select "input#place_longitude[name=?]", "place[longitude]"

      assert_select "input#place_latitude[name=?]", "place[latitude]"
    end
  end
end
