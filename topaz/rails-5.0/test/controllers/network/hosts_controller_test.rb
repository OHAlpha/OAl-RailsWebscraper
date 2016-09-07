require 'test_helper'

class Network::HostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @network_host = network_hosts(:one)
  end

  test "should get index" do
    get network_hosts_url
    assert_response :success
  end

  test "should get new" do
    get new_network_host_url
    assert_response :success
  end

  test "should create network_host" do
    assert_difference('Network::Host.count') do
      post network_hosts_url, params: { network_host: { host_name: @network_host.host_name } }
    end

    assert_redirected_to network_host_url(Network::Host.last)
  end

  test "should show network_host" do
    get network_host_url(@network_host)
    assert_response :success
  end

  test "should get edit" do
    get edit_network_host_url(@network_host)
    assert_response :success
  end

  test "should update network_host" do
    patch network_host_url(@network_host), params: { network_host: { host_name: @network_host.host_name } }
    assert_redirected_to network_host_url(@network_host)
  end

  test "should destroy network_host" do
    assert_difference('Network::Host.count', -1) do
      delete network_host_url(@network_host)
    end

    assert_redirected_to network_hosts_url
  end
end
