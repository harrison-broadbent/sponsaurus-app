require 'rails_helper'

RSpec.describe "newsletters/index", type: :view do
  before(:each) do
    assign(:newsletters, [
      Newsletter.create!(
        name: "Name"
      ),
      Newsletter.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of newsletters" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
