require 'rails_helper'

RSpec.describe "slot_types/show", type: :view do
  before(:each) do
    @slot_type = assign(:slot_type, SlotType.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
