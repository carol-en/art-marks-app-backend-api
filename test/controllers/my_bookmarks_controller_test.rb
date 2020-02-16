require 'test_helper'

class MyBookmarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @my_bookmark = my_bookmarks(:one)
  end

  test "should get index" do
    get my_bookmarks_url, as: :json
    assert_response :success
  end

  test "should create my_bookmark" do
    assert_difference('MyBookmark.count') do
      post my_bookmarks_url, params: { my_bookmark: { category: @my_bookmark.category, description: @my_bookmark.description, img: @my_bookmark.img, site_name: @my_bookmark.site_name, url: @my_bookmark.url } }, as: :json
    end

    assert_response 201
  end

  test "should show my_bookmark" do
    get my_bookmark_url(@my_bookmark), as: :json
    assert_response :success
  end

  test "should update my_bookmark" do
    patch my_bookmark_url(@my_bookmark), params: { my_bookmark: { category: @my_bookmark.category, description: @my_bookmark.description, img: @my_bookmark.img, site_name: @my_bookmark.site_name, url: @my_bookmark.url } }, as: :json
    assert_response 200
  end

  test "should destroy my_bookmark" do
    assert_difference('MyBookmark.count', -1) do
      delete my_bookmark_url(@my_bookmark), as: :json
    end

    assert_response 204
  end
end
