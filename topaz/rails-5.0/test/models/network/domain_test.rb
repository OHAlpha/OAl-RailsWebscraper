require 'test_helper'

class Network::DomainTest < ActiveSupport::TestCase
    # test "the truth" do
    #     assert true
    # end
    
    test "should not save nil name" do
        domain = Network::Domain.new
        assert_not domain.save
    end
    
    test "should not save empty name" do
        domain = Network::Domain.new name: ''
        assert_not domain.save
    end
    
    test "should not save name of soley whitespace" do
        domain = Network::Domain.new name: ' '
        assert_not domain.save
    end
    
    test "should not save name with spaces" do
        domain = Network::Domain.new name: 'do main'
        assert_not domain.save
    end
    
    test "should not save name with double dots" do
        domain = Network::Domain.new name: 'domain..ext'
        assert_not domain.save
    end
    
    test "valid domain creation" do
        domain = Network::Domain.create name: 'edu'
        assert_equal 'edu', domain.name
        assert_nil domain.parent
    end
    
    test "valid domain creation with parent" do
        parent = Network::Domain.create! name: 'io'
        domain = Network::Domain.create! name: 'c9', parent: parent
        assert_equal 'c9', domain.name
        assert_not_nil domain.parent
        assert_equal 'io', domain.parent.name
        assert_nil domain.parent.parent
        assert_equal 'c9.io', domain.full_name
    end
    
    test "valid multi-domain creation" do
        domain = Network::Domain.create! name: 'www.google.com'
        assert_equal 'www', domain.name
        assert_not_nil domain.parent
        assert_equal 'google', domain.parent.name
        assert_not_nil domain.parent.parent
        assert_equal 'com', domain.parent.parent.name
        assert_nil domain.parent.parent.parent
        assert_equal 'www.google.com', domain.full_name
    end
    
end