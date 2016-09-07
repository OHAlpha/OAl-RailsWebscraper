require 'test_helper'

class Network::DomainsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @network_domain = network_domains(:one)
  end

  test "should get index" do
    get network_domains_url
    assert_response :success
  end

  test "should get new" do
    get new_network_domain_url
    assert_response :success
  end

  test "should create network_domain" do
    assert_difference('Network::Domain.count') do
      post network_domains_url, params: { network_domain: { name: @network_domain.name } }
    end

    assert_redirected_to network_domain_url(Network::Domain.last)
  end

  test "should show network_domain" do
    get network_domain_url(@network_domain)
    assert_response :success
  end

  test "should get edit" do
    get edit_network_domain_url(@network_domain)
    assert_response :success
  end

  test "should update network_domain" do
    patch network_domain_url(@network_domain), params: { network_domain: { name: @network_domain.name } }
    assert_redirected_to network_domain_url(@network_domain)
  end

  test "should destroy network_domain" do
    assert_difference('Network::Domain.count', -1) do
      delete network_domain_url(@network_domain)
    end

    assert_redirected_to network_domains_url
  end
end
