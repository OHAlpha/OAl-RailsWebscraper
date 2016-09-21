class Network::Avenue < ApplicationRecord
    
    attr_accessor :priority
    
    serialize :query, Array
    
    belongs_to :file, class_name: 'Network::File', inverse_of: :avenues
    
    has_many :accesses, class_name: 'Network::Access', inverse_of: :avenue, foreign_key: 'avenue_id'
    
    before_validation :verify_file
    before_validation :verify_url
    
    after_validation :canonicalize
    
    after_create do |avenue|
        if avenue.priority.nil?
            priority = Network::Job.default_priority
        else
            priority = avenue.priority
        end
        if priority != Network::Job.skip_priority
            avenue.accesses.create! do |access|
                access.priority = priority
                access.request_method = 'GET'
                access.auxillary_request_headers = {}
                access.request_headers = Network::HeaderSet.first
            end
        end
    end
    
    after_initialize do
        if not query.nil?
            @query_array = eval(query)
        end
    end
    
    validates :protocol, presence: true
    
    validates :query, presence: true
    
    validates :file, presence: true
    
    validates :url, presence: true
    validate :url_string
    
    def query_array=(arr)
        @query_array = arr
        if arr.nil?
            self.query = nil
        else
            self.query = @query_array.to_s
        end
    end
    
    # returns :file's host name
    def host_name
    end
    
    # returns :file's full path
    def full_path
    end
    
    # returns :file's port
    def port
    end
    
    def query_string
        if query.nil?
            ''
        else
            pairs = query.collect { |key_val| key_val.join '=' }
            "?#{pairs.join '&'}"
        end
    end
    
    def colored_url
        #"<span style=\"color: red\">#{protocol}</span>://<a href=\"#{network_file_url file}\"></a><span style=\"color: green\">#{query}</span>"
        "<span style=\"color: red\">#{protocol}</span>://#{file.colored_url}<span style=\"color: green\">#{query_string}</span>"
    end
    
    def self.canonicalize_protocol
    end
    
    def self.canonicalize_query
    end
    
    def self.canonicalize_avenue_url
    end
    
    private
        
        def verify_file
            if ( file.nil? or protocol.nil? ) and not url.nil?
                us = URI.split url
                self.protocol = us[0]
                host = us[2]
                port = us[3]
                path = us[5]
                query = us[7]
                
                if not query.nil?
                    self.query = query.split('&').collect { |pair| pair.split '=' }
                end
                
                self.file = Network::File.find_or_create_by url: "#{host}#{Network::File.port_string port}#{path}"
            end
        end
        
        # constructs :url from :host and :path if :url is not specified
        def verify_url
            if url.nil?
                self.url = "#{protocol}://#{file.url}#{query_string}"
            end
        end
        
        def canonicalize
        end
        
        def url_string
        end
        
end