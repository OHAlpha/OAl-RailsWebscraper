class Network::Header < ApplicationRecord
    
    has_many :inclusions, class_name: 'Network::HeaderInclusion', inverse_of: :header, foreign_key: 'header_id'
    has_many :uses, through: :inclusions, class_name: 'Network::HeaderSet'
    
    private
        
        
        
end