require 'rails_helper'

RSpec.describe "working_days/new", type: :view do
  before(:each) do
    assign(:working_day, WorkingDay.new())
  end

  it "renders new working_day form" do
    render

    assert_select "form[action=?][method=?]", working_days_path, "post" do
    end
  end
end
