require 'test_helper'

class DudasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dudas_index_url
    assert_response :success
  end

end
