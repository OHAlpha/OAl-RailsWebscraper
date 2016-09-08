class Network::Domain < ApplicationRecord
    
    # sets the parent-child relationship
    # => specifies that when a domain is destroyed, all of its descendants are also destroyed
    belongs_to :parent, class_name: 'Network::Domain', inverse_of: :children, dependent: :destroy
    has_many :children, class_name: 'Network::Domain', inverse_of: :parent, foreign_key: 'parent_id'
    
    # sets the domain-host relationship
    # => specifies that when a host is destroyed, its associated domain is also destroyed
    has_one :host, class_name: 'Network::Host', inverse_of: :domain, dependent: :destroy
    
    # causes parent to validate after destruction
    after_destroy :validate_domain
    
    # validates name for presence and validity
    validates :name, presence: true
    validate :ascii_name
    validate :no_spaces
    
    private
        
        # calls check_for_children on parent after destruction
        # This is to check if a domain has any children.
        # Domains with no children should be destroyed as well.
        def validate_domain
        end
        
        # checks if this domain has any children
        # Domains with no children should be destroyed as well.
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
        
        # checks the :name contains no spaces
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