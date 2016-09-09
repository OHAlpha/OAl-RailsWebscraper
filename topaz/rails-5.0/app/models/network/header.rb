class Network::Header < ApplicationRecord
    
    has_many :inclusions, class_name: 'Network::HeaderInclusion', inverse_of: :header, foreign_key: 'header_id'
    has_many :uses, through: :inclusions, class_name: 'Network::HeaderSet'
    
    after_validation :canonicalize
    
    validates :header_name, presence: true, format: { with: /\w+(-\w+)?/, message: '' }
    
    validates :header_value, presence: true
    
    private
        
        def canonicalize
        end
        
end