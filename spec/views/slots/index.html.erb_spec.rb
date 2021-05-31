require 'rails_helper'

RSpec.describe "slots/index", type: :view do
  before(:each) do
    assign(:slots, [
      Slot.create!(
        price: ""
      ),
      Slot.create!(
        price: ""
      )
    ])
  end

  it "renders a list of slots" do
    render
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
