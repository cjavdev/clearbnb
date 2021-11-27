require "test_helper"

class Host::PhotosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get host_photos_index_url
    assert_response :success
  end
end
