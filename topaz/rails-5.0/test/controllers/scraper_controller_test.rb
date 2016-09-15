require 'test_helper'

class ScraperControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get scraper_home_url
    assert_response :success
  end

  test "should get statistics" do
    get scraper_statistics_url
    assert_response :success
  end

  test "should get scrape" do
    get scraper_scrape_url
    assert_response :success
  end

  test "should get scrape_results" do
    get scraper_scrape_results_url
    assert_response :success
  end

  test "should get avenue" do
    get scraper_avenue_url
    assert_response :success
  end

  test "should get make_request" do
    get scraper_make_request_url
    assert_response :success
  end

  test "should get request_results" do
    get scraper_request_results_url
    assert_response :success
  end

  test "should get visit_url" do
    get scraper_visit_url_url
    assert_response :success
  end

  test "should get access" do
    get scraper_access_url
    assert_response :success
  end

  test "should get access_response" do
    get scraper_access_response_url
    assert_response :success
  end

  test "should get helper_sets" do
    get scraper_helper_sets_url
    assert_response :success
  end

  test "should get helper_set" do
    get scraper_helper_set_url
    assert_response :success
  end

  test "should get documents" do
    get scraper_documents_url
    assert_response :success
  end

  test "should get document" do
    get scraper_document_url
    assert_response :success
  end

  test "should get document_data" do
    get scraper_document_data_url
    assert_response :success
  end

  test "should get contents" do
    get scraper_contents_url
    assert_response :success
  end

  test "should get content" do
    get scraper_content_url
    assert_response :success
  end

  test "should get content_data" do
    get scraper_content_data_url
    assert_response :success
  end

  test "should get pages" do
    get scraper_pages_url
    assert_response :success
  end

  test "should get page_map" do
    get scraper_page_map_url
    assert_response :success
  end

  test "should get page" do
    get scraper_page_url
    assert_response :success
  end

  test "should get page_data" do
    get scraper_page_data_url
    assert_response :success
  end

  test "should get images" do
    get scraper_images_url
    assert_response :success
  end

  test "should get image" do
    get scraper_image_url
    assert_response :success
  end

  test "should get image_data" do
    get scraper_image_data_url
    assert_response :success
  end

end