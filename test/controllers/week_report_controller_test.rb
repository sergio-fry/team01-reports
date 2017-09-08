require 'test_helper'

class WeekReportControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get week_report_show_url
    assert_response :success
  end

end
