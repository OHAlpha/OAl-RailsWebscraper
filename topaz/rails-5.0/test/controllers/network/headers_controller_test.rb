require 'test_helper'

class Network::HeadersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @network_header = network_headers(:one)
  end

  test "should get index" do
    get network_headers_url
    assert_response :success
  end

  test "should get new" do
    get new_network_header_url
    assert_response :success
  end

  test "should create network_header" do
    assert_difference('Network::Header.count') do
      post network_headers_url, params: { network_header: { header_name: @network_header.header_name, header_value: @network_header.header_value } }
    end

    assert_redirected_to network_header_url(Network::Header.last)
  end

  test "should show network_header" do
    get network_header_url(@network_header)
    assert_response :success
  end

  test "should get edit" do
    get edit_network_header_url(@network_header)
    assert_response :success
  end

  test "should update network_header" do
    patch network_header_url(@network_header), params: { network_header: { header_name: @network_header.header_name, header_value: @network_header.header_value } }
    assert_redirected_to network_header_url(@network_header)
  end

  test "should destroy network_header" do
    assert_difference('Network::Header.count', -1) do
      delete network_header_url(@network_header)
    end

    assert_redirected_to network_headers_url
  end
end
