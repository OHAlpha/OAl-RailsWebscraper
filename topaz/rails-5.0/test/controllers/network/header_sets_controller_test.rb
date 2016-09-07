require 'test_helper'

class Network::HeaderSetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @network_header_set = network_header_sets(:one)
  end

  test "should get index" do
    get network_header_sets_url
    assert_response :success
  end

  test "should get new" do
    get new_network_header_set_url
    assert_response :success
  end

  test "should create network_header_set" do
    assert_difference('Network::HeaderSet.count') do
      post network_header_sets_url, params: { network_header_set: { headers_string: @network_header_set.headers_string } }
    end

    assert_redirected_to network_header_set_url(Network::HeaderSet.last)
  end

  test "should show network_header_set" do
    get network_header_set_url(@network_header_set)
    assert_response :success
  end

  test "should get edit" do
    get edit_network_header_set_url(@network_header_set)
    assert_response :success
  end

  test "should update network_header_set" do
    patch network_header_set_url(@network_header_set), params: { network_header_set: { headers_string: @network_header_set.headers_string } }
    assert_redirected_to network_header_set_url(@network_header_set)
  end

  test "should destroy network_header_set" do
    assert_difference('Network::HeaderSet.count', -1) do
      delete network_header_set_url(@network_header_set)
    end

    assert_redirected_to network_header_sets_url
  end
end
