class Network::Job < ApplicationRecord
    
    belongs_to :access, class_name: 'Network::Access', inverse_of: :jobs
    
end