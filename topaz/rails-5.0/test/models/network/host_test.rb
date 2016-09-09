require 'test_helper'

class Network::HostTest < ActiveSupport::TestCase
    # test "the truth" do
    #     assert true
    # end
    
    test "create with inconsistent domain and host_name" do
        host = Network::Host.create! domain: network_domains(:de_wikipedia_domain), host_name: 'en.wikipedia.org'
        assert_equal network_domains(:de_wikipedia_domain).id, host.domain.id
        assert_equal network_domains(:de_wikipedia_domain).full_name, host.host_name
    end
    
    test "create from domain" do
        host = Network::Host.create! domain: network_domains(:de_wikipedia_domain)
        assert_equal network_domains(:de_wikipedia_domain).id, host.domain.id
        assert_equal network_domains(:de_wikipedia_domain).full_name, host.host_name
    end
    
    test "create from existing domain name" do
        host = Network::Host.create! host_name: 'de.wikipedia.org'
        assert_equal network_domains(:de_wikipedia_domain).id, host.domain.id
        assert_equal network_domains(:de_wikipedia_domain).full_name, host.host_name
    end
    
    test "create from host name" do
        host = Network::Host.create! host_name: 'www.google.com'
        assert_not_nil host.domain
        assert_equal 'www', host.domain.name
        assert_equal 'www.google.com', host.host_name
    end
    
end