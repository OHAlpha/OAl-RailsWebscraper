require 'test_helper'

class Network::NetworkControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get network_network_home_url
    assert_response :success
  end

  test "should get index" do
    get network_network_index_url
    assert_response :success
  end

end
