require 'test_helper'

class Network::PathsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @network_path = network_paths(:one)
  end

  test "should get index" do
    get network_paths_url
    assert_response :success
  end

  test "should get new" do
    get new_network_path_url
    assert_response :success
  end

  test "should create network_path" do
    assert_difference('Network::Path.count') do
      post network_paths_url, params: { network_path: { name: @network_path.name } }
    end

    assert_redirected_to network_path_url(Network::Path.last)
  end

  test "should show network_path" do
    get network_path_url(@network_path)
    assert_response :success
  end

  test "should get edit" do
    get edit_network_path_url(@network_path)
    assert_response :success
  end

  test "should update network_path" do
    patch network_path_url(@network_path), params: { network_path: { name: @network_path.name } }
    assert_redirected_to network_path_url(@network_path)
  end

  test "should destroy network_path" do
    assert_difference('Network::Path.count', -1) do
      delete network_path_url(@network_path)
    end

    assert_redirected_to network_paths_url
  end
end
