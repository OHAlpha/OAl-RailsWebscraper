require 'test_helper'

class Content::DocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @content_document = content_documents(:one)
  end

  test "should get index" do
    get content_documents_url
    assert_response :success
  end

  test "should get new" do
    get new_content_document_url
    assert_response :success
  end

  test "should create content_document" do
    assert_difference('Content::Document.count') do
      post content_documents_url, params: { content_document: { avenue_id: @content_document.avenue_id, contents_count: @content_document.contents_count, source_id: @content_document.source_id } }
    end

    assert_redirected_to content_document_url(Content::Document.last)
  end

  test "should show content_document" do
    get content_document_url(@content_document)
    assert_response :success
  end

  test "should get edit" do
    get edit_content_document_url(@content_document)
    assert_response :success
  end

  test "should update content_document" do
    patch content_document_url(@content_document), params: { content_document: { avenue_id: @content_document.avenue_id, contents_count: @content_document.contents_count, source_id: @content_document.source_id } }
    assert_redirected_to content_document_url(@content_document)
  end

  test "should destroy content_document" do
    assert_difference('Content::Document.count', -1) do
      delete content_document_url(@content_document)
    end

    assert_redirected_to content_documents_url
  end
end
