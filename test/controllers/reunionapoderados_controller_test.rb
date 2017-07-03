require 'test_helper'

class ReunionapoderadosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reunionapoderados_index_url
    assert_response :success
  end

end
