require 'rails_helper'

RSpec.describe "slots/show", type: :view do
  before(:each) do
    @slot = assign(:slot, Slot.create!(
      price: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
