class Network::HeaderInclusion < ApplicationRecord
    
    belongs_to :set, class_name: 'Network::HeaderSet', inverse_of: :inclusions
    
    belongs_to :header, class_name: 'Network::Header', inverse_of: :inclusions
    
    validates :set, presence: true
    
    validates :header, presence: true
    
    validate :single_header
    
    private
        
        # check if :set already has a header of the same name as :header
        def single_header
        end
        
end