require 'test_helper'

class Content::HtmlLinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @content_html_link = content_html_links(:one)
  end

  test "should get index" do
    get content_html_links_url
    assert_response :success
  end

  test "should get new" do
    get new_content_html_link_url
    assert_response :success
  end

  test "should create content_html_link" do
    assert_difference('Content::HtmlLink.count') do
      post content_html_links_url, params: { content_html_link: { source_id: @content_html_link.source_id, target_id: @content_html_link.target_id } }
    end

    assert_redirected_to content_html_link_url(Content::HtmlLink.last)
  end

  test "should show content_html_link" do
    get content_html_link_url(@content_html_link)
    assert_response :success
  end

  test "should get edit" do
    get edit_content_html_link_url(@content_html_link)
    assert_response :success
  end

  test "should update content_html_link" do
    patch content_html_link_url(@content_html_link), params: { content_html_link: { source_id: @content_html_link.source_id, target_id: @content_html_link.target_id } }
    assert_redirected_to content_html_link_url(@content_html_link)
  end

  test "should destroy content_html_link" do
    assert_difference('Content::HtmlLink.count', -1) do
      delete content_html_link_url(@content_html_link)
    end

    assert_redirected_to content_html_links_url
  end
end
