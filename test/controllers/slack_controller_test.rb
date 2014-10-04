require 'test_helper'

class SlackControllerTest < ActionController::TestCase
  test "should get integration" do
    get :integration
    assert_response :success
  end

end
