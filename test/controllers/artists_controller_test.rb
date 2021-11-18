require "test_helper"

class ArtistsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get(artists_url)
    assert_response(:success)
  end

  test 'should get new' do
    get(new_artist_url)
    assert_response(:success)
  end
end
