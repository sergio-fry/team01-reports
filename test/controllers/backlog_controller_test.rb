require 'test_helper'

class BacklogControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get backlog_show_url
    assert_response :success
  end

end
