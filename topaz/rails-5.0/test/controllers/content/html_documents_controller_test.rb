require 'test_helper'

class Content::HtmlDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @content_html_document = content_html_documents(:one)
  end

  test "should get index" do
    get content_html_documents_url
    assert_response :success
  end

  test "should get new" do
    get new_content_html_document_url
    assert_response :success
  end

  test "should create content_html_document" do
    assert_difference('Content::HtmlDocument.count') do
      post content_html_documents_url, params: { content_html_document: { links_count: @content_html_document.links_count, title: @content_html_document.title } }
    end

    assert_redirected_to content_html_document_url(Content::HtmlDocument.last)
  end

  test "should show content_html_document" do
    get content_html_document_url(@content_html_document)
    assert_response :success
  end

  test "should get edit" do
    get edit_content_html_document_url(@content_html_document)
    assert_response :success
  end

  test "should update content_html_document" do
    patch content_html_document_url(@content_html_document), params: { content_html_document: { links_count: @content_html_document.links_count, title: @content_html_document.title } }
    assert_redirected_to content_html_document_url(@content_html_document)
  end

  test "should destroy content_html_document" do
    assert_difference('Content::HtmlDocument.count', -1) do
      delete content_html_document_url(@content_html_document)
    end

    assert_redirected_to content_html_documents_url
  end
end
