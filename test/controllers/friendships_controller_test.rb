require 'test_helper'

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get friendships_index_url
    assert_response :success
  end

  test "should get create" do
    get friendships_create_url
    assert_response :success
  end

  test "should get block" do
    get friendships_block_url
    assert_response :success
  end

  test "should get remove" do
    get friendships_remove_url
    assert_response :success
  end

end
