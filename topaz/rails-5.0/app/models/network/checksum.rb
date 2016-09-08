class Network::Checksum < ApplicationRecord
    
    belongs_to :type, class_name: 'Network::ChecksumType'
    
    belongs_to :access, class_name: 'Network::Access', inverse_of: :sums
    
end