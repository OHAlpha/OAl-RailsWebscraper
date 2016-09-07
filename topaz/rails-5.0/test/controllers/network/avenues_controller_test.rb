require 'test_helper'

class Network::AvenuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @network_avenue = network_avenues(:one)
  end

  test "should get index" do
    get network_avenues_url
    assert_response :success
  end

  test "should get new" do
    get new_network_avenue_url
    assert_response :success
  end

  test "should create network_avenue" do
    assert_difference('Network::Avenue.count') do
      post network_avenues_url, params: { network_avenue: { file_id: @network_avenue.file_id, protocol: @network_avenue.protocol, query: @network_avenue.query, url: @network_avenue.url } }
    end

    assert_redirected_to network_avenue_url(Network::Avenue.last)
  end

  test "should show network_avenue" do
    get network_avenue_url(@network_avenue)
    assert_response :success
  end

  test "should get edit" do
    get edit_network_avenue_url(@network_avenue)
    assert_response :success
  end

  test "should update network_avenue" do
    patch network_avenue_url(@network_avenue), params: { network_avenue: { file_id: @network_avenue.file_id, protocol: @network_avenue.protocol, query: @network_avenue.query, url: @network_avenue.url } }
    assert_redirected_to network_avenue_url(@network_avenue)
  end

  test "should destroy network_avenue" do
    assert_difference('Network::Avenue.count', -1) do
      delete network_avenue_url(@network_avenue)
    end

    assert_redirected_to network_avenues_url
  end
end
