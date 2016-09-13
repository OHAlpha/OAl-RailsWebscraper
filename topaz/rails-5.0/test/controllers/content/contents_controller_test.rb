require 'test_helper'

class Content::ContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @content_content = content_contents(:one)
  end

  test "should get index" do
    get content_contents_url
    assert_response :success
  end

  test "should get new" do
    get new_content_content_url
    assert_response :success
  end

  test "should create content_content" do
    assert_difference('Content::Content.count') do
      post content_contents_url, params: { content_content: { avenue_id: @content_content.avenue_id, references_count: @content_content.references_count, source_id: @content_content.source_id } }
    end

    assert_redirected_to content_content_url(Content::Content.last)
  end

  test "should show content_content" do
    get content_content_url(@content_content)
    assert_response :success
  end

  test "should get edit" do
    get edit_content_content_url(@content_content)
    assert_response :success
  end

  test "should update content_content" do
    patch content_content_url(@content_content), params: { content_content: { avenue_id: @content_content.avenue_id, references_count: @content_content.references_count, source_id: @content_content.source_id } }
    assert_redirected_to content_content_url(@content_content)
  end

  test "should destroy content_content" do
    assert_difference('Content::Content.count', -1) do
      delete content_content_url(@content_content)
    end

    assert_redirected_to content_contents_url
  end
end
