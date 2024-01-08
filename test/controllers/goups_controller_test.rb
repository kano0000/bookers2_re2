require "test_helper"

class GoupsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get goups_new_url
    assert_response :success
  end

  test "should get index" do
    get goups_index_url
    assert_response :success
  end

  test "should get show" do
    get goups_show_url
    assert_response :success
  end

  test "should get edit" do
    get goups_edit_url
    assert_response :success
  end
end
