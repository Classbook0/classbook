require 'test_helper'

class TallerculturalesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tallerculturales_index_url
    assert_response :success
  end

end
