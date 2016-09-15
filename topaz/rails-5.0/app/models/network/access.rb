class Network::Access < ApplicationRecord
    
    attr_accessor :priority
    
    serialize :request_auxillary_headers, Hash
    serialize :response_headers, Hash
    
    belongs_to :avenue, class_name: 'Network::Avenue', inverse_of: :accesses
    
    belongs_to :request_headers, class_name: 'Network::HeaderSet', inverse_of: :uses
    
    has_many :sums, class_name: 'Network::Checksum', inverse_of: :access, foreign_key: 'access_id'
    
    has_many :jobs, class_name: 'Network::Job', inverse_of: :access, foreign_key: 'access_id'
    has_many :finished_jobs, class_name: 'Network::Job', foreign_key: 'access_id', -> { where status: Network::Job.completed_status }
    has_many :pending_jobs, class_name: 'Network::Job', foreign_key: 'access_id', -> { where.not status: Network::Job.completed_status }
  
    before_validation do |access|
        if access.created.nil?
            access.created = Time.now
        end
    end
    
    after_create do |access|
        if access.priority.nil?
            access.jobs.create! priority: Network::Job.default_priority
        else
            access.jobs.create! priority: access.priority
        end
    end
    
    validates :request_method, presence: true
    
    validates :request_auxillary_headers, presence: true
    
    validates :created, presence: true
    
    validates :avenue, presence: true
    
    validates :request_headers, presence: true
    
    # returns :avenue's host name
    def host_name
    end
    
    # returns :avenue's full path
    def full_path
    end
    
    # returns :avenue's port
    def port
    end
    
    # returns :avenue's protocol
    def protocol
    end
    
    # returns :avenue's query
    def query
    end
    
    def self.canonicalize_request_method
    end
    
    def self.canonicalize_auxillary_headers
    end
    
    private
        
        def canonicalize
        end
        
end