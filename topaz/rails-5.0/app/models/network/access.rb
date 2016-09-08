class Network::Access < ApplicationRecord
    
    serialize :request_auxillary_headers, Hash
    serialize :response_headers, Hash
    
    belongs_to :avenue, class_name: 'Network::Avenue', inverse_of: :accesses
    
    belongs_to :request_headers, class_name: 'Network::HeaderSet', inverse_of: :uses
    
    has_many :sums, class_name: 'Network::Checksum', inverse_of: :access, foreign_key: 'access_id'
    
    has_many :jobs, class_name: 'Network::Job', inverse_of: :access, foreign_key: 'access_id'
    
    # returns :avenue's host name
    def host_name
    end
    
    # returns :avenue's full path
    def full_path
    end
    
    # returns :avenue's port
    def port
    end
    
    # returns :avenue's protocol
    def protocol
    end
    
    # returns :avenue's query
    def query
    end
    
end