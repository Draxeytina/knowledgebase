require 'application_system_test_case'

class TrendsTest < ApplicationSystemTestCase
  setup do
    @trend = trends(:one)
  end

  test 'visiting the index' do
    visit trends_url
    assert_selector 'h1', text: 'Trends'
  end
end
