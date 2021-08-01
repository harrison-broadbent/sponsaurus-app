require 'rails_helper'

RSpec.describe "slot_types/edit", type: :view do
  before(:each) do
    @slot_type = assign(:slot_type, SlotType.create!())
  end

  it "renders the edit slot_type form" do
    render

    assert_select "form[action=?][method=?]", slot_type_path(@slot_type), "post" do
    end
  end
end
