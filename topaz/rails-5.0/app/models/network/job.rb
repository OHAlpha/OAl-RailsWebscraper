class Network::Job < ApplicationRecord
    
    belongs_to :access, class_name: 'Network::Access', inverse_of: :jobs
    
    validates :priority, presence: true
    
    validates :downloaded, presence: true
    
    validates :status, presence: true
    
    validates :message, presence: true
    
    validates :long_message, presence: true
    
    validates :access, presence: true
    
    def meta(s,sm,lm=nil)
        self.status = s
        self.message = sm
        self.long_message = if lm.nil? then sm else lm end
    end
  
    def meta_and_save(s,sm,lm=nil)
        meta(s,sm,lm)
        save
    end
    
    def self.default_priority
        5
    end
    
    def self.highest_priority
        0
    end
    
    def self.lowest_priority
        10
    end
    
    def self.skip_priority
        -1
    end
    
    def self.increment_priority(p)
        if p == skip_priority
            lowest_priority
        elsif p <= highest_priority
            highest_priority
        else
            p - 1
        end
    end
    
    def self.decrement_priority(p)
        if p == skip_priority
            skip_priority
        elsif p >= lowest_priority
            lowest_priority
        else
            p - 1
        end
    end
    
    def self.initial_status
        1
    end
    
    def self.initial_message
        "job has not started"
    end
    
    def self.initial_long_message
        "job has not started"
    end
    
    def self.completed_status
        0
    end
    
    def self.default_completed_message
        "job has completed"
    end
    
    def self.default_completed_long_message
        "job has completed"
    end
    
    def self.status_message(code)
        states = {initial_status: "not started", completed_status: "completed"}
        states[code]
    end
    
end