require 'rails_helper'

RSpec.describe "slots/new", type: :view do
  before(:each) do
    assign(:slot, Slot.new(
      price: ""
    ))
  end

  it "renders new slot form" do
    render

    assert_select "form[action=?][method=?]", slots_path, "post" do

      assert_select "input[name=?]", "slot[price]"
    end
  end
end
