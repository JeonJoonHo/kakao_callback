require 'test_helper'

class KakaoControllerTest < ActionDispatch::IntegrationTest
  test "should get callback" do
    get kakao_callback_url
    assert_response :success
  end

  test "should get index" do
    get kakao_index_url
    assert_response :success
  end

end
