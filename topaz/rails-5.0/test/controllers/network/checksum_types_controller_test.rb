require 'test_helper'

class Network::ChecksumTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @network_checksum_type = network_checksum_types(:one)
  end

  test "should get index" do
    get network_checksum_types_url
    assert_response :success
  end

  test "should get new" do
    get new_network_checksum_type_url
    assert_response :success
  end

  test "should create network_checksum_type" do
    assert_difference('Network::ChecksumType.count') do
      post network_checksum_types_url, params: { network_checksum_type: { bits: @network_checksum_type.bits, name: @network_checksum_type.name } }
    end

    assert_redirected_to network_checksum_type_url(Network::ChecksumType.last)
  end

  test "should show network_checksum_type" do
    get network_checksum_type_url(@network_checksum_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_network_checksum_type_url(@network_checksum_type)
    assert_response :success
  end

  test "should update network_checksum_type" do
    patch network_checksum_type_url(@network_checksum_type), params: { network_checksum_type: { bits: @network_checksum_type.bits, name: @network_checksum_type.name } }
    assert_redirected_to network_checksum_type_url(@network_checksum_type)
  end

  test "should destroy network_checksum_type" do
    assert_difference('Network::ChecksumType.count', -1) do
      delete network_checksum_type_url(@network_checksum_type)
    end

    assert_redirected_to network_checksum_types_url
  end
end
