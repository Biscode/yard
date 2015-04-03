require 'rails_helper'

RSpec.describe "sprints/new", type: :view do
  before(:each) do
    assign(:sprint, Sprint.new(
      :number => 1
    ))
  end

  it "renders new sprint form" do
    render

    assert_select "form[action=?][method=?]", sprints_path, "post" do

      assert_select "input#sprint_number[name=?]", "sprint[number]"
    end
  end
end
