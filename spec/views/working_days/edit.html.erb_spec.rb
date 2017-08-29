require 'rails_helper'

RSpec.describe "working_days/edit", type: :view do
  before(:each) do
    @working_day = assign(:working_day, WorkingDay.create!())
  end

  it "renders the edit working_day form" do
    render

    assert_select "form[action=?][method=?]", working_day_path(@working_day), "post" do
    end
  end
end
