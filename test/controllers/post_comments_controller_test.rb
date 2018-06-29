require 'test_helper'

class PostCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get post_comments_show_url
    assert_response :success
  end

  test "should get edit" do
    get post_comments_edit_url
    assert_response :success
  end

end
