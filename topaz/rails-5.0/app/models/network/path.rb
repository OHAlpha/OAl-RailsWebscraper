class Network::Path < ApplicationRecord
    
    # sets the parent-child relationship
    # => specifies that when a domain is destroyed, all of its descendants are also destroyed
    belongs_to :parent, class_name: 'Network::Path', inverse_of: :children, autosave: true
    has_many :children, class_name: 'Network::Path', inverse_of: :parent, foreign_key: 'parent_id', dependent: :destroy
    
    # sets the path-file relationship
    # => specifies that when a path is destroyed, its associated file is also destroyed
    has_one :file, class_name: 'Network::File', inverse_of: :path, foreign_key: 'path_id', dependent: :destroy
    
    # checks if :name is a compound name
    before_validation :cascade_names
    
    after_validation :canonicalize
    
    # causes parent to validate after destruction
    after_destroy :validate_parent
    
    # validates name for presence and validity
    validates :name, presence: true, format: { with: /\s*\S+\s*/, message: '' }
    validate :ascii_name
    validate :special_character_placement
    
    # returns the full name of this path
    # full name is the full name of :parent (if it exists) suffixed by a slash and this path's name
    def full_name
    end
    
    def self.canonicalize_file_name
    end
    
    def self.canonicalize_path_name
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
        
        # checks that :name does not contain special characters
        def special_character_placement
        end
        
    
end