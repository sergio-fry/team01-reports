require 'test_helper'

class DailyReportControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get daily_report_new_url
    assert_response :success
  end

  test "should get show" do
    get daily_report_show_url
    assert_response :success
  end

end
