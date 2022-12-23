require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end

  test 'should get index' do
    get articles_url
    assert_response :success
  end
end
