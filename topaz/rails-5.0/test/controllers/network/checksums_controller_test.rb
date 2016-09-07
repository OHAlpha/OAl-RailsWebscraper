require 'test_helper'

class Network::ChecksumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @network_checksum = network_checksums(:one)
  end

  test "should get index" do
    get network_checksums_url
    assert_response :success
  end

  test "should get new" do
    get new_network_checksum_url
    assert_response :success
  end

  test "should create network_checksum" do
    assert_difference('Network::Checksum.count') do
      post network_checksums_url, params: { network_checksum: { bits: @network_checksum.bits, hex: @network_checksum.hex, type_id: @network_checksum.type_id, value: @network_checksum.value } }
    end

    assert_redirected_to network_checksum_url(Network::Checksum.last)
  end

  test "should show network_checksum" do
    get network_checksum_url(@network_checksum)
    assert_response :success
  end

  test "should get edit" do
    get edit_network_checksum_url(@network_checksum)
    assert_response :success
  end

  test "should update network_checksum" do
    patch network_checksum_url(@network_checksum), params: { network_checksum: { bits: @network_checksum.bits, hex: @network_checksum.hex, type_id: @network_checksum.type_id, value: @network_checksum.value } }
    assert_redirected_to network_checksum_url(@network_checksum)
  end

  test "should destroy network_checksum" do
    assert_difference('Network::Checksum.count', -1) do
      delete network_checksum_url(@network_checksum)
    end

    assert_redirected_to network_checksums_url
  end
end
