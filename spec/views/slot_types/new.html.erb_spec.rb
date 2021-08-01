require 'rails_helper'

RSpec.describe "slot_types/new", type: :view do
  before(:each) do
    assign(:slot_type, SlotType.new())
  end

  it "renders new slot_type form" do
    render

    assert_select "form[action=?][method=?]", slot_types_path, "post" do
    end
  end
end
