class Network::HeaderSet < ApplicationRecord
    
    has_many :inclusions, class_name: 'Network::HeaderInclusion', inverse_of: :set, foreign_key: 'set_id'
    has_many :headers, through: :inclusions, class_name: 'Network::Header'
    
    has_many :uses, class_name: 'Network::Access', inverse_of: :request_headers
    
    before_validation :verify_inclusions
    before_validation :verify_headers
      
    after_initialize do
        @headers_string_hash = eval(headers_string)
    end
    
    after_initialize do |header_set|
        @headers_string_hash = eval(headers_string)
    end
    
    validates :headers_string, presence: true
    validate :valid_headers
    validate :match_headers
    
    def headers_string_hash
        @headers_string_hash
    end
      
    def headers_string_hash=(hash)
        @headers_string_hash = hash
        self.headers_string = @headers_string_hash.to_s
    end
    
    def headers_string_hash=(hash)
        @headers_string_hash = hash
        self.headers_string = @headers_string_hash.to_s
    end
    
    def self.canonicalize_headers_string
    end
    
    private
        
        def verify_inclusions
        end
        
        def verify_headers
        end
        
        def valid_headers
        end
        
        def match_headers
        end
        
end