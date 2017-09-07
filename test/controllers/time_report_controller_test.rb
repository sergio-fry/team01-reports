require 'test_helper'

class TimeReportControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get time_report_show_url
    assert_response :success
  end

end
