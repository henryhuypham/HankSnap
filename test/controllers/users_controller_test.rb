require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get authenticate" do
    get users_authenticate_url
    assert_response :success
  end

end
