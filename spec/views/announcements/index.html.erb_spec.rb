require 'rails_helper'

RSpec.describe "announcements/index", type: :view do
  before(:each) do
    assign(:announcements, [
      Announcement.create!(
        :announcement => "MyText"
      ),
      Announcement.create!(
        :announcement => "MyText"
      )
    ])
  end

  it "renders a list of announcements" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
