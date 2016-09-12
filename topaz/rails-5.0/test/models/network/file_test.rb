require 'test_helper'

class Network::FileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    
    test "create with inconsistent path and full_path" do
        file = Network::File.new path: network_paths(:wiki_Ampere), full_path: '/wiki/Amp', host: network_hosts(:en_wikipedia)
        assert_not file.save
    end
    
    test "create from path" do
        file = Network::File.create! path: network_paths(:wiki_Ampere), host: network_hosts(:en_wikipedia)
        assert_equal network_paths(:wiki_Ampere).id, file.path.id
        assert_equal network_paths(:wiki_Ampere).full_name, file.full_path
    end
    
    test "create from existing path name" do
        file = Network::File.create! full_path: '/wiki/Ampere', host: network_hosts(:en_wikipedia)
        assert_equal network_paths(:wiki_Ampere).id, file.path.id
        assert_equal network_paths(:wiki_Ampere).full_name, file.full_path
    end
    
    test "create from file name" do
        file = Network::File.create! full_path: '/wiki/Alternating_current', host: network_hosts(:en_wikipedia)
        assert_not_nil file.path
        assert_equal 'Alternating_current', file.path.name
        assert_equal '/wiki/Alternating_current', file.full_path
    end
    
    test "create from url" do
        file = Network::File.create! url: 'en.wikipedia.org/wiki/Alternating_current'
        assert_not_nil file.path
        assert_equal 'Alternating_current', file.path.name
        assert_equal '/wiki/Alternating_current', file.full_path
        assert_equal 'en.wikipedia.org/wiki/Alternating_current', file.url
    end
    
end