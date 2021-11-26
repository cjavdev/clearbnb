require "test_helper"

class ListingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get listings_index_url
    assert_response :success
  end

  test "should get show" do
    get listings_show_url
    assert_response :success
  end
end
