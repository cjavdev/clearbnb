require "test_helper"

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reservations_index_url
    assert_response :success
  end

  test "should get show" do
    get reservations_show_url
    assert_response :success
  end
end
