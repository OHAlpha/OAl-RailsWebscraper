class Network::HeaderSet < ApplicationRecord
    
    serialize :headers_string, Hash
    
    has_many :inclusions, class_name: 'Network::HeaderInclusion', inverse_of: :set, foreign_key: 'set_id'
    has_many :headers, through: :inclusions, class_name: 'Network::Header'
    
    has_many :uses, class_name: 'Network::Access', inverse_of: :request_headers
    
    before_validation :verify_inclusions
    before_validation :verify_headers
    
    validate :match_headers
    
    private
        
        def verify_inclusions
        end
        
        def verify_headers
        end
        
        def match_headers
        end
        
end