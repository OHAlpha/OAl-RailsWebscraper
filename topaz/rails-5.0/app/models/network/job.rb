class Network::Job < ApplicationRecord
    
    belongs_to :access, class_name: 'Network::Access', inverse_of: :jobs
    
    validates :priority, presence: true
    
    validates :downloaded, presence: true
    
    validates :status, presence: true
    
    validates :message, presence: true
    
    validates :long_message, presence: true
    
    validates :access, presence: true
    
    def self.default_priority
    end
    
    def self.highest_priority
    end
    
    def self.initial_status
    end
    
    def self.initial_message
    end
    
    def self.initial_long_message
    end
    
    def self.completed_status
    end
    
    def self.default_completed_message
    end
    
    def self.default_completed_long_message
    end
    
    def meta(s,sm,lm=nil)
        self.status = s
        self.message = sm
        self.long_message = if lm.nil? then sm else lm end
    end
  
    def meta_and_save(s,sm,lm=nil)
        meta(s,sm,lm)
        save
    end
    
end