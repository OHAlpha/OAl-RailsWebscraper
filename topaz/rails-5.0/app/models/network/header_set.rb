class Network::HeaderSet < ApplicationRecord
    
    has_many :inclusions, class_name: 'Network::HeaderInclusion', inverse_of: :set, foreign_key: 'set_id'
    has_many :headers, through: :inclusions, class_name: 'Network::Header'
    
    has_many :uses, class_name: 'Network::Access', inverse_of: :request_headers
    
    private
        
        
        
end