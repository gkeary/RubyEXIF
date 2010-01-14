require "test/unit"
require "exif"

class MyTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @@d = PhotoCollection.new
  end

  def test_jpgfiles
  #MyTest::setup()
      assert_equal(13, @@d.get_jpgfiles_size())
      assert_operator(@@d.get_jpgfiles_size(), :>, 0)
  end

  def test_get_first_width
    assert_equal(2592, @@d.get_first_width)
  end
  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def test_photo_load
    z = @@d.load_photo     
    assert_operator(z.size, :>, 0)
  end

#  def test_dupe_load
#    z = @@d.load_photo
#    hash = Photo::get_hash
#    i = 0
#    z = hash.values
#    max = hash.values { |x|
#      i = i < x ? x : i++
#      return i
#      }
#    assert_operator( max, :>, 2 )
#  end
  def teardown
    # Do nothing
  end

  # Fake test
  def test_fail

    # To change this template use File | Settings | File Templates.
    # fail("Not implemented")
  end
end
