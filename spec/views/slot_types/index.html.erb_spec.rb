require 'rails_helper'

RSpec.describe "slot_types/index", type: :view do
  before(:each) do
    assign(:slot_types, [
      SlotType.create!(),
      SlotType.create!()
    ])
  end

  it "renders a list of slot_types" do
    render
  end
end
