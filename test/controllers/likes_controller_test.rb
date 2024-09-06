require "test_helper"

class LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get :new" do
    get likes_:new_url
    assert_response :success
  end
end
