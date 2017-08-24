require 'test_helper'

class GanttControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get gantt_show_url
    assert_response :success
  end

end
