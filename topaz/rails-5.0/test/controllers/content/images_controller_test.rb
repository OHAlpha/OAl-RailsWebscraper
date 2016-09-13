require 'test_helper'

class Content::ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @content_image = content_images(:one)
  end

  test "should get index" do
    get content_images_url
    assert_response :success
  end

  test "should get new" do
    get new_content_image_url
    assert_response :success
  end

  test "should create content_image" do
    assert_difference('Content::Image.count') do
      post content_images_url, params: { content_image: { height: @content_image.height, width: @content_image.width } }
    end

    assert_redirected_to content_image_url(Content::Image.last)
  end

  test "should show content_image" do
    get content_image_url(@content_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_content_image_url(@content_image)
    assert_response :success
  end

  test "should update content_image" do
    patch content_image_url(@content_image), params: { content_image: { height: @content_image.height, width: @content_image.width } }
    assert_redirected_to content_image_url(@content_image)
  end

  test "should destroy content_image" do
    assert_difference('Content::Image.count', -1) do
      delete content_image_url(@content_image)
    end

    assert_redirected_to content_images_url
  end
end
