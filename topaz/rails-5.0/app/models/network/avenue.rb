class Network::Avenue < ApplicationRecord
    
    belongs_to :file, class_name: 'Network::File', inverse_of: :avenues
    
    has_many :accesses, class_name: 'Network::Access', inverse_of: :avenue, foreign_key: 'avenue_id'
    
    # returns :file's host name
    def host_name
    end
    
    # returns :file's full path
    def host_name
    end
end