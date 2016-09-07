require 'test_helper'

class Network::HeaderInclusionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @network_header_inclusion = network_header_inclusions(:one)
  end

  test "should get index" do
    get network_header_inclusions_url
    assert_response :success
  end

  test "should get new" do
    get new_network_header_inclusion_url
    assert_response :success
  end

  test "should create network_header_inclusion" do
    assert_difference('Network::HeaderInclusion.count') do
      post network_header_inclusions_url, params: { network_header_inclusion: { header_id: @network_header_inclusion.header_id, set_id: @network_header_inclusion.set_id } }
    end

    assert_redirected_to network_header_inclusion_url(Network::HeaderInclusion.last)
  end

  test "should show network_header_inclusion" do
    get network_header_inclusion_url(@network_header_inclusion)
    assert_response :success
  end

  test "should get edit" do
    get edit_network_header_inclusion_url(@network_header_inclusion)
    assert_response :success
  end

  test "should update network_header_inclusion" do
    patch network_header_inclusion_url(@network_header_inclusion), params: { network_header_inclusion: { header_id: @network_header_inclusion.header_id, set_id: @network_header_inclusion.set_id } }
    assert_redirected_to network_header_inclusion_url(@network_header_inclusion)
  end

  test "should destroy network_header_inclusion" do
    assert_difference('Network::HeaderInclusion.count', -1) do
      delete network_header_inclusion_url(@network_header_inclusion)
    end

    assert_redirected_to network_header_inclusions_url
  end
end
