require 'test_helper'

class Intento1ControllerTest < ActionController::TestCase
  test "should get i1" do
    get :i1
    assert_response :success
  end

end
