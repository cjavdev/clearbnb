require "test_helper"

class Host::ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get host_reservations_show_url
    assert_response :success
  end
end
