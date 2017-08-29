require 'rails_helper'

RSpec.describe "working_days/show", type: :view do
  before(:each) do
    @working_day = assign(:working_day, WorkingDay.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
