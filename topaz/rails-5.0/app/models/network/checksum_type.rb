class Network::ChecksumType < ApplicationRecord
    
    validates :name, presence: true
    
    validates :bits, presence: true
    
    validates :value_eval, presence: true
    
    validates :bits_eval, presence: true
    
    validates :hex_eval, presence: true
    
end