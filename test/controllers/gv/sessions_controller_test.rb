require 'test_helper'

class Gv::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get gv_sessions_new_url
    assert_response :success
  end

end
