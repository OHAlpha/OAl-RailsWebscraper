class Network::Domain < ApplicationRecord
    
    # sets the parent-child relationship
    # => specifies that when a domain is destroyed, all of its descendants are also destroyed
    belongs_to :parent, class_name: 'Network::Domain', inverse_of: :children, autosave: true
    has_many :children, class_name: 'Network::Domain', inverse_of: :parent, foreign_key: 'parent_id', dependent: :destroy
    
    # sets the domain-host relationship
    # => specifies that when a domain is destroyed, its associated host is also destroyed
    has_one :host, class_name: 'Network::Host', inverse_of: :domain, foreign_key: 'domain_id', dependent: :destroy
    
    # checks if :name is a compound name
    before_validation :cascade_names
    
    after_validation :canonicalize
    
    # causes parent to validate after destruction
    after_destroy :validate_parent
    
    # validates name for presence and validity
    validates :name, presence: true, format: { with: /\s*\S+\s*/, message: '' }
    validate :ascii_name
    validate :no_spaces
    
    # returns the full name of this domain
    # full name is the full name of :parent (if it exists) prepended by this domain's name and a period
    def full_name
    end
    
    def self.canonicalize_domain_name
    end
    
    def self.canonicalize_host_name
    end
    
    private
        
        # checks if :name is a compound name and if so, creates parents for each additional name
        # :name is compund if it contains any periods.
        # :name is to be split by any periods present
        def cascade_names
        end
        
        def canonicalize
        end
        
        # calls check_for_children on parent after destruction
        # This is to check if a domain has any children or domains.
        # Domains with no children or domains should be destroyed as well.
        def validate_parent
        end
        
        # checks if this domain has any children or domains
        # Domains with no children or domains should be destroyed as well.
        def check_for_children
        end
        
        # checks that :name consists of only ASCII characters
        def ascii_name
            # TODO: code from previous project -- needs verification and/or revision
            if not name.nil? and not name.ascii_only?
                errors.add(:name, 'domain name can only include ASCII characters')
            end
            if not full_name.nil? and not full_name.ascii_only?
                errors.add(:full_name, 'domain name can only include ASCII characters')
            end
        end
        
        # checks that :name contains no spaces except on the ends
        def no_spaces
            # TODO: code from previous project -- needs verification and/or revision
            if not name.nil? and not name.index(' ').nil?
                errors.add(:name, 'domain name cannot include spaces')
            end
            if not full_name.nil? and not full_name.index(' ').nil?
                errors.add(:full_name, 'domain name cannot include spaces')
            end
        end
        
    
end