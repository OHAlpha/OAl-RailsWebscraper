class ScraperController < ApplicationController
  def home
  end

  def statistics
  end

  def scrape
  end

  def scrape_results
  end
  
  def make_request
  end
  
  def request_results
  end

  def visit_url
    avenue = nil
    Network::Avenue.transaction do
      avenue = Network::Avenue.find_or_create_by url: params[:url] do |a|
        if params[:priority].nil?
          a.priority = Network::Job.highest_priority
        else
          a.priority = params[:priority]
        end
      end
    end
=begin
    avenue.transaction do
      if avenue.
    end
=end
  end

  def avenue
    @avenue = Network::Avenue.find params[:avenue_id]
  end

  def access
    @access = Network::Access.find params[:access_id]
  end

  def access_response
    @access = Network::Access.find params[:access_id]
  end

  def helper_sets
    @helper_sets = Network::HeaderSet.all
  end

  def helper_set
    @helper_set = Network::HeaderSet.find params[:helper_set_id]
  end

  def documents
    @documents = Content::Document.all
  end

  def document
    @document = Content::Document.find params[:document_id]
  end

  def document_data
    @document = Content::Document.find params[:document_id]
  end

  def contents
    @contents = Content::Content.all
  end

  def content
    @content = Content::Content.find params[content_id]
  end

  def content_data
    @content = Content::Content.find params[content_id]
  end

  def pages
    @pages = Content::HtmlDocument.all
  end

  def page_map
  end

  def page
    @page = Content::HtmlDocument.find params[page_id]
  end

  def page_data
    @page = Content::HtmlDocument.find params[page_id]
  end

  def images
    @image = Content::Image.all
  end

  def image
    @image = Content::Image.find params[image_id]
  end

  def image_data
    @image = Content::Image.find params[image_id]
  end
end