require 'rails_helper'

RSpec.describe "bookings/index", type: :view do
  before(:each) do
    assign(:bookings, [
      Booking.create!(
        references: ""
      ),
      Booking.create!(
        references: ""
      )
    ])
  end

  it "renders a list of bookings" do
    render
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
