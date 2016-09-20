class Network::Host < ApplicationRecord
    
    # sets the domain-host relationship
    # => specifies that when a host is destroyed, its associated domain is also destroyed
    belongs_to :domain, class_name: 'Network::Domain', inverse_of: :host, autosave: true, dependent: :destroy
    
    # sets the host-file relationship
    # => specifies that when a host is destroyed, its files are also destroyed
    has_many :files, class_name: 'Network::File', inverse_of: :host, dependent: :destroy
    
    # creates a domain corresponding to :host_name if one is not specified or constructs :host_name from :domain if :host_name is not specified
    before_validation :verify_domain
    before_validation :verify_host_name
    
    after_validation :canonicalize
    
    # validates :domain for presence
    validates :domain, presence: true
    
    # validates :host_name for presence and agreement with :domain
    validates :host_name, presence: true
    validate :domain_name
    
    def colored_url
        "<span style=\"color: #88f\">#{host_name}</span>"
    end
    
    private
        
        # creates a domain corresponding to :host_name if one is not specified
        def verify_domain
            if domain.nil? and not host_name.nil?
                self.domain = Network::Domain.find_or_create_by name: host_name
            end
        end
        
        # constructs :host_name from :domain if :host_name is not specified
        def verify_host_name
            if host_name.nil? and not domain.nil?
                self.url = domain.full_name
            end
        end
        
        def canonicalize
        end
        
        # checks if :domain's full name matches :host_name
        def domain_name
        end
        
end