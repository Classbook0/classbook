require 'test_helper'

class ConveniosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get convenios_index_url
    assert_response :success
  end

end
