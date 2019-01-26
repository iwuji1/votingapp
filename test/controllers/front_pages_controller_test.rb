require 'test_helper'

class FrontPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get front_pages_home_url
    assert_response :success
  end

  test "should get help" do
    get front_pages_help_url
    assert_response :success
  end

end
