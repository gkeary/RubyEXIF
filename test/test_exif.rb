require 'test/unit'
require 'lib/exif'

class EXIFTest < Test::Unit::TestCase
  def self.setup
    @@d = Exif.new
  end

	def test_jpgfiles
    EXIFTest::setup()
		assert_equal(13, @@d.get_size())
        assert_operator(@@d.get_size(), :>, 0)
	end

  def test_recurse
    EXIFTest::setup()
    #filecount =count_files
    #a = copy_jpg_dir
    #puts "a: #{a}"
    assert_equal( count_files, @@d.get_size())

  end
  def count_files
    @@d.get_size() 
  end

end