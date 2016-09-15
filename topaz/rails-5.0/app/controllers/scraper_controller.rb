class ScraperController < ApplicationController
  def home
  end

  def statistics
  end

  def scrape
  end

  def scrape_results
  end

  def visit_url
    avenue = Network::Avenue.find_or_create_by url: params[:url]
  end

  def avenue
  end

  def access
  end

  def access_response
  end

  def documents
  end

  def document
  end

  def document_data
  end

  def contents
  end

  def content
  end

  def content_data
  end

  def pages
  end

  def page_map
  end

  def page
  end

  def page_data
  end

  def images
  end

  def image
  end

  def image_data
  end
end