require "test_helper"

class ArtistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artist = artists(:one)
  end

  test 'should get index' do
    get(artists_url)
    assert_response(:success)
  end

  test 'should get new' do
    get(new_artist_url)
    assert_response(:success)
  end

  test 'should create artst' do
    assert_difference('Artist.count') do
      post(
        artists_url,
        params: {
          artist: {
            name: @artist.name,
            category: @artist.category,
            debut_year: @artist.debut_year,
          }
        }
      )
    end

    assert_redirected_to(artist_url(Artist.last))
  end

  test 'should show artist' do
    get(artist_url(@artist))
    assert_response(:success)
  end
end
