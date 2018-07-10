require 'test_helper'

class SavesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get saves_index_url
    assert_response :success
  end

  test "should get edit" do
    get saves_edit_url
    assert_response :success
  end

end
