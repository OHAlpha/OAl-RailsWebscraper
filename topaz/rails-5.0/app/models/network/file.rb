class Network::File < ApplicationRecord
    
    # sets the path-file relationship
    # => specifies that when a file is destroyed, its associated path is also destroyed
    belongs_to :path, class_name: 'Network::Path', inverse_of: :file, autosave: true, dependent: :destroy
    
    # sets the host-file relationship
    belongs_to :host, class_name: 'Network::Host', inverse_of: :files
    
    has_many :avenues, class_name: 'Network::Avenue', inverse_of: :file, foreign_key: 'file_id', dependent: :destroy
    
    # creates a path corresponding to :full_path if one is not specified or constructs :full_path from :path if :full_path is not specified
    before_validation :verify_path
    before_validation :verify_full_path
    
    # creates a host and path corresponding to :url if either is not specified or constructs :url from :host and :path if :url is not specified
    before_validation :verify_parents
    before_validation :verify_url
    
    after_validation :canonicalize
    
    # validates :path for presence
    validates :path, presence: true
    
    # validates :host_name for presence and agreement with :domain
    validates :full_path, presence: true
    validate :path_name
    
    validates :url, presence: true
    validate :url_string
    
    # returns :host's host name
    def host_name
    end
    
    def colored_url
        "#{host.colored_url}<span style=\"color: orange\">#{self.class.port_string port}</span><span style=\"color: gray\">#{full_path}</span>"
    end
    
    def self.canonicalize_file_url
    end
        
    def self.port_string(port)
        if port.nil?
            ''
        else
            ":#{port.to_s}"
        end
    end
    
    private
        
        # creates a path corresponding to :full_path if one is not specified
        def verify_path
        end
        
        # constructs :full_path from :path if :full_path is not specified
        def verify_full_path
        end
        
        # creates a host and path corresponding to :url if either is not specified
        def verify_parents
            if ( path.nil? or host.nil? ) and not url.nil?
                as = url.split '/'
                os = as[0].split ':'
                host = os[0]
                if os.size == 2
                    self.port = os[1]
                end
                self.full_path = '/' + as[1..-1].join('/')
                
                self.host = Network::Host.find_or_create_by host_name: host
                self.path = Network::Path.find_or_create_by name: self.full_path
            end
        end
        
        # constructs :url from :host and :path if :url is not specified
        def verify_url
            if url.nil? and not path.nil? and not host.nil?
                self.url = "#{host.host_name}#{port_string port}#{path.full_name}"
            end
        end
        
        def canonicalize
        end
        
        # checks if :path's full name matches :full_path
        def path_name
        end
        
        def url_string
        end
        
end