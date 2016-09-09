require 'test_helper'

class Network::PathTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    
    test "should not save nil name" do
        path = Network::Path.new
        assert_not path.save
    end
    
    test "should not save empty name" do
        path = Network::Path.new name: ''
        assert_not path.save
    end
    
    test "should not save name of soley whitespace" do
        path = Network::Path.new name: ' '
        assert_not path.save
    end
    
    test "should not save name with spaces" do
        path = Network::Path.new name: 'p ath'
        assert_not path.save
    end
    
    test "should not save name with double slash" do
        path = Network::Path.new name: 'path/file'
        assert_not path.save
    end
    
    test "valid path creation" do
        path = Network::Path.create name: 'path'
        assert_equal 'path', path.name
        assert_nil path.parent
    end
    
    test "valid path creation with parent" do
        parent = Network::Path.create! name: 'to'
        path = Network::Path.create! name: 'file', parent: parent
        assert_equal 'file', path.name
        assert_not_nil path.parent
        assert_equal 'to', path.parent.name
        assert_not_nil path.parent.parent
        assert_equal '/', path.parent.parent.name
        assert_nil path.parent.parent.parent
        assert_equal '/to/file', path.full_name
    end
    
    test "valid multi-path creation" do
        path = Network::Path.create! name: 'alpha/beta/gamma'
        assert_equal 'gamma', path.name
        assert_not_nil path.parent
        assert_equal 'beta', path.parent.name
        assert_not_nil path.parent.parent
        assert_equal 'alpha', path.parent.parent.name
        assert_not_nil path.parent.parent.parent
        assert_equal '/', path.parent.parent.parent.name
        assert_nil path.parent.parent.parent.parent
        assert_equal '/alpha/beta/gamma', path.full_name
    end
    
end