require 'test_helper'

class Network::AvenueTest < ActiveSupport::TestCase
    # test "the truth" do
    #     assert true
    # end
    
    test "create from file" do
        avenue = Network::Avenue.new file: network_files(:Arc_diagram), protocol: 'https'
        avenue.save!
        assert_equal network_files(:Arc_diagram).id, avenue.file.id
        assert_equal 'https://en.wikipedia.org/wiki/Arc_diagram', avenue.url
    end
    
    test "create from url" do
        avenue = Network::Avenue.new url: 'https://en.wikipedia.org/wiki/Alternating_current'
        avenue.save!
        assert_equal 'Alternating_current', avenue.file.path.name
        assert_equal '/wiki/Alternating_current', avenue.full_path
        assert_equal 'en.wikipedia.org', avenue.host.host_name
        assert_equal 'https', avenue.protocol
        assert_equal 'https://en.wikipedia.org/wiki/Alternating_current', avenue.url
    end
    
end