require 'rails_helper'

RSpec.describe "trips/new", type: :view do
  before(:each) do
    assign(:trip, Trip.new(
      :driver => nil,
      :source => nil,
      :destination => nil,
      :seats => 1
    ))
  end

  it "renders new trip form" do
    render

    assert_select "form[action=?][method=?]", trips_path, "post" do

      assert_select "input#trip_driver_id[name=?]", "trip[driver_id]"

      assert_select "input#trip_source_id[name=?]", "trip[source_id]"

      assert_select "input#trip_destination_id[name=?]", "trip[destination_id]"

      assert_select "input#trip_seats[name=?]", "trip[seats]"
    end
  end
end
