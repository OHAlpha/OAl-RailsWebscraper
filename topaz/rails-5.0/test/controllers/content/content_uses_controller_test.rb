require 'test_helper'

class Content::ContentUsesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @content_content_use = content_content_uses(:one)
  end

  test "should get index" do
    get content_content_uses_url
    assert_response :success
  end

  test "should get new" do
    get new_content_content_use_url
    assert_response :success
  end

  test "should create content_content_use" do
    assert_difference('Content::ContentUse.count') do
      post content_content_uses_url, params: { content_content_use: { content_id: @content_content_use.content_id, document_id: @content_content_use.document_id } }
    end

    assert_redirected_to content_content_use_url(Content::ContentUse.last)
  end

  test "should show content_content_use" do
    get content_content_use_url(@content_content_use)
    assert_response :success
  end

  test "should get edit" do
    get edit_content_content_use_url(@content_content_use)
    assert_response :success
  end

  test "should update content_content_use" do
    patch content_content_use_url(@content_content_use), params: { content_content_use: { content_id: @content_content_use.content_id, document_id: @content_content_use.document_id } }
    assert_redirected_to content_content_use_url(@content_content_use)
  end

  test "should destroy content_content_use" do
    assert_difference('Content::ContentUse.count', -1) do
      delete content_content_use_url(@content_content_use)
    end

    assert_redirected_to content_content_uses_url
  end
end
