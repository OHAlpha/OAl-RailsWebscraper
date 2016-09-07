require 'test_helper'

class Network::AccessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @network_access = network_accesses(:one)
  end

  test "should get index" do
    get network_accesses_url
    assert_response :success
  end

  test "should get new" do
    get new_network_access_url
    assert_response :success
  end

  test "should create network_access" do
    assert_difference('Network::Access.count') do
      post network_accesses_url, params: { network_access: { accessed: @network_access.accessed, avenue_id: @network_access.avenue_id, created: @network_access.created, request_auxillary_headers: @network_access.request_auxillary_headers, request_body: @network_access.request_body, request_cookie: @network_access.request_cookie, request_headers_id: @network_access.request_headers_id, request_length: @network_access.request_length, request_md5: @network_access.request_md5, request_method: @network_access.request_method, request_range: @network_access.request_range, request_type: @network_access.request_type, response_body: @network_access.response_body, response_code: @network_access.response_code, response_cookie: @network_access.response_cookie, response_headers: @network_access.response_headers } }
    end

    assert_redirected_to network_access_url(Network::Access.last)
  end

  test "should show network_access" do
    get network_access_url(@network_access)
    assert_response :success
  end

  test "should get edit" do
    get edit_network_access_url(@network_access)
    assert_response :success
  end

  test "should update network_access" do
    patch network_access_url(@network_access), params: { network_access: { accessed: @network_access.accessed, avenue_id: @network_access.avenue_id, created: @network_access.created, request_auxillary_headers: @network_access.request_auxillary_headers, request_body: @network_access.request_body, request_cookie: @network_access.request_cookie, request_headers_id: @network_access.request_headers_id, request_length: @network_access.request_length, request_md5: @network_access.request_md5, request_method: @network_access.request_method, request_range: @network_access.request_range, request_type: @network_access.request_type, response_body: @network_access.response_body, response_code: @network_access.response_code, response_cookie: @network_access.response_cookie, response_headers: @network_access.response_headers } }
    assert_redirected_to network_access_url(@network_access)
  end

  test "should destroy network_access" do
    assert_difference('Network::Access.count', -1) do
      delete network_access_url(@network_access)
    end

    assert_redirected_to network_accesses_url
  end
end
