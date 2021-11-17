require "test_helper"

class ArtistTest < ActiveSupport::TestCase
  fixtures :artists
  
  test 'new artist attributes cannot be empty' do
    artist = Artist.new

    assert(artist.invalid?)

    assert(artist.errors[:name].any?)
    assert_equal(["Name cannot be empty"], artist.errors[:name])
    
    assert(artist.errors[:category].any?)
    
    assert(artist.errors[:debut_year].any?)
    assert_equal(["Debut year cannot be empty"], artist.errors[:debut_year])
  end

  test 'artist category must be either band, duo or singer' do
    artist = Artist.new(name: artists(:one).name, category: "orchestra", debut_year: artists(:one).debut_year)
    
    assert(artist.invalid?)

    assert(artist.errors[:category].any?)
    assert_equal(['orchestra is not a valid category. Category must be one of ["band", "duo", "singer"]'], artist.errors[:category])
  end

  test 'artist name must not exceed 100 characters' do
    long_name = (0..101).map { ('a'..'z').to_a[rand(26)] }.join
    artist = Artist.new(name: long_name, category: artists(:one).category, debut_year: artists(:one).debut_year)
    
    assert(artist.invalid?)

    assert(artist.errors[:name].any?)
    assert_equal(['Name cannot exceed 100 characters'], artist.errors[:name])
  end
end
