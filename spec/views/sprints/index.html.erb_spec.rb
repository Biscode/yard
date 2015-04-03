require 'rails_helper'

RSpec.describe "sprints/index", type: :view do
  before(:each) do
    assign(:sprints, [
      Sprint.create!(
        :number => 1
      ),
      Sprint.create!(
        :number => 1
      )
    ])
  end

  it "renders a list of sprints" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
