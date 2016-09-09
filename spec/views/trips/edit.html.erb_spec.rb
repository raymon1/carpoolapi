require 'rails_helper'

RSpec.describe "trips/edit", type: :view do
  before(:each) do
    @trip = assign(:trip, Trip.create!(
      :driver => nil,
      :source => nil,
      :destination => nil,
      :seats => 1
    ))
  end

  it "renders the edit trip form" do
    render

    assert_select "form[action=?][method=?]", trip_path(@trip), "post" do

      assert_select "input#trip_driver_id[name=?]", "trip[driver_id]"

      assert_select "input#trip_source_id[name=?]", "trip[source_id]"

      assert_select "input#trip_destination_id[name=?]", "trip[destination_id]"

      assert_select "input#trip_seats[name=?]", "trip[seats]"
    end
  end
end
