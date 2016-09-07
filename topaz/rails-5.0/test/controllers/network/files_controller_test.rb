require 'test_helper'

class Network::FilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @network_file = network_files(:one)
  end

  test "should get index" do
    get network_files_url
    assert_response :success
  end

  test "should get new" do
    get new_network_file_url
    assert_response :success
  end

  test "should create network_file" do
    assert_difference('Network::File.count') do
      post network_files_url, params: { network_file: { full_path: @network_file.full_path, host_id: @network_file.host_id, path_id: @network_file.path_id, port: @network_file.port, url: @network_file.url } }
    end

    assert_redirected_to network_file_url(Network::File.last)
  end

  test "should show network_file" do
    get network_file_url(@network_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_network_file_url(@network_file)
    assert_response :success
  end

  test "should update network_file" do
    patch network_file_url(@network_file), params: { network_file: { full_path: @network_file.full_path, host_id: @network_file.host_id, path_id: @network_file.path_id, port: @network_file.port, url: @network_file.url } }
    assert_redirected_to network_file_url(@network_file)
  end

  test "should destroy network_file" do
    assert_difference('Network::File.count', -1) do
      delete network_file_url(@network_file)
    end

    assert_redirected_to network_files_url
  end
end
