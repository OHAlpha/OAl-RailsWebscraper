class Network::Checksum < ApplicationRecord
    
    belongs_to :type, class_name: 'Network::ChecksumType'
    
    belongs_to :access, class_name: 'Network::Access', inverse_of: :sums
    
    before_validation :verify_hash
    
    validates :hex, presence: true
    
    validates :type, presence: true
    
    validates :access, presence: true
    
    private
        
        def verify_hash
            if not type.nil? and not access.nil?
                input = access.response_body
                if value.nil?
                    self.value = eval type.value_eval
                end
                if bits.nil?
                    self.bits = eval type.bits_eval
                end
                if hex.nil?
                    self.hex = eval type.hex_eval
                end
            end
        end
        
end