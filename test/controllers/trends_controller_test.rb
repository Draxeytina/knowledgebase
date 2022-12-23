require 'test_helper'

class TrendsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trend = trends(:one)
  end

  test 'should get index' do
    get trends_url
    assert_response :success
  end

  test 'should create trend' do
    assert_difference('Trend.count') do
      post trends_url, params: { trend: { search: @trend.search, session_id: @trend.session_id } }
    end

    assert_redirected_to trend_url(Trend.last)
  end
end
