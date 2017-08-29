require 'rails_helper'

RSpec.describe "working_days/index", type: :view do
  before(:each) do
    assign(:working_days, [
      WorkingDay.create!(),
      WorkingDay.create!()
    ])
  end

  it "renders a list of working_days" do
    render
  end
end
