class DebugController < ApplicationController
  before_action :verify_host_name
  
  def home
  end

  def index
  end
  
  protected
    
    def verify_host_name
    end
    
end