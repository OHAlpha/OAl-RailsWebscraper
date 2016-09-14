require 'test_helper'

class Content::ContentControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get content_content_home_url
    assert_response :success
  end

  test "should get index" do
    get content_content_index_url
    assert_response :success
  end

end
