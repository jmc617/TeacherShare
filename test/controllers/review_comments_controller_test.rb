require 'test_helper'

class ReviewCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get review_comments_show_url
    assert_response :success
  end

  test "should get edit" do
    get review_comments_edit_url
    assert_response :success
  end

end
