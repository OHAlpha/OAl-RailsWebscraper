class Network::Avenue < ApplicationRecord
    
    serialize :query, Array
    
    belongs_to :file, class_name: 'Network::File', inverse_of: :avenues
    
    has_many :accesses, class_name: 'Network::Access', inverse_of: :avenue, foreign_key: 'avenue_id'
    
    before_validation :verify_file
    before_validation :verify_url
    
    after_validation :canonicalize
    
    validates :protocol, presence: true
    
    validates :query, presence: true
    
    validates :file, presence: true
    
    validates :url, presence: true
    validate :url_string
    
    # returns :file's host name
    def host_name
    end
    
    # returns :file's full path
    def full_path
    end
    
    # returns :file's port
    def port
    end
    
    def self.canonicalize_protocol
    end
    
    def self.canonicalize_query
    end
    
    def self.canonicalize_avenue_url
    end
    
    private
        
        def verify_file
            # TODO: code from previous project -- needs verification and/or revision
            if ( file.nil? or protocol.nil? ) and not url.nil?
                us = URI.split url
                self.protocol = us[0]
                host = us[2]
                port = us[3]
                path = us[5]
                self.query = us[7]
                
                self.file = Network::File.find_or_create_by path: Network::Path.find_or_create_by(full_name: path), port: port, host: Network::Host.find_or_create_by(domain: Network::Domain.find_or_create_by(full_name: host))
            end
        end
        
        # constructs :url from :host and :path if :url is not specified
        def verify_url
            # TODO: code from previous project -- needs verification and/or revision
            if url.nil?
                if query.nil?
                    q = ''
                else
                    q = query
                end
                self.url = "#{protocol}://#{file.url}#{q}"
            end
        end
        
        def canonicalize
        end
        
        def url_string
        end
        
end