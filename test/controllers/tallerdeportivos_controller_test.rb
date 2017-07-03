require 'test_helper'

class TallerdeportivosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tallerdeportivos_index_url
    assert_response :success
  end

end
