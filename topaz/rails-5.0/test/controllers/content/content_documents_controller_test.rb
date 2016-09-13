require 'test_helper'

class Content::ContentDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @content_content_document = content_content_documents(:one)
  end

  test "should get index" do
    get content_content_documents_url
    assert_response :success
  end

  test "should get new" do
    get new_content_content_document_url
    assert_response :success
  end

  test "should create content_content_document" do
    assert_difference('Content::ContentDocument.count') do
      post content_content_documents_url, params: { content_content_document: { document_id: @content_content_document.document_id } }
    end

    assert_redirected_to content_content_document_url(Content::ContentDocument.last)
  end

  test "should show content_content_document" do
    get content_content_document_url(@content_content_document)
    assert_response :success
  end

  test "should get edit" do
    get edit_content_content_document_url(@content_content_document)
    assert_response :success
  end

  test "should update content_content_document" do
    patch content_content_document_url(@content_content_document), params: { content_content_document: { document_id: @content_content_document.document_id } }
    assert_redirected_to content_content_document_url(@content_content_document)
  end

  test "should destroy content_content_document" do
    assert_difference('Content::ContentDocument.count', -1) do
      delete content_content_document_url(@content_content_document)
    end

    assert_redirected_to content_content_documents_url
  end
end
