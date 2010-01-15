# Let's figure out how to handle arrays of photos
#  as well as hashes.

# populate an array of jpg files

require 'exifr'
f_array = Dir[File.join('C:/exif/rubyexif/lib',"**/*.jpg")]

h1 = { }
photo_hash = {}
f_array.each do |file|
            dt = EXIFR::JPEG.new(file).date_time
            if h1.has_key?(dt)
              counter = h1[dt].size + 1
              h1[dt] = h1[dt].merge(counter=> file)
            else
              h1[dt] = {1=>file}
            end
end #f_array.each
 def transform(hh = {})
   a= 0
   result={}
   hh.each do |x,y|
     pk = "k#{a+=1}"
     v1= {"ts" => x}
     v2= v1.merge(y)
     result = result.merge(pk => v2)
   end
result
 end

photo_hash = transform(h1)



puts photo_hash.size
puts photo_hash.sort.to_yaml

=begin
----------------------------------------------------------- Hash#merge
   hsh.merge(other_hash)                              -> a_hash
   hsh.merge(other_hash){|key, oldval, newval| block} -> a_hash
----------------------------------------------------------------------
   Returns a new hash containing the contents of _other_hash_ and the
   contents of _hsh_, overwriting entries in _hsh_ with duplicate keys
   with those from _other_hash_.

      h1 = { "a" => 100, "b" => 200 }
      h2 = { "b" => 254, "c" => 300 }
      h1.merge(h2)   #=> {"a"=>100, "b"=>254, "c"=>300}
      h1             #=> {"a"=>100, "b"=>200}
=emd

#puts photo_array.size
#puts photo_array.inspect


=begin

f_array.each { |f|
  keys.each_pair {  |k,v|
    z = EXIFR::JPEG.new(f).date_time
    keys[f].push(f) if k == z
    }
  }
keys.each_pair { |x, v| puts "t: #{x} => #{v}" }

=end

=begin
        @jpgfiles.each do |x|
      s = EXIFR::JPEG.new(x).date_time
      z = x.length
      if z > 50
        y = x[45..-1] # 'c:/documents and settings/gkeary/my documents/my pictures')
        else
        y = x[1..-1] # 'c:/documents and settings/gkeary/my documents/my pictures')
      end
      puts "stamp: #{s}| #{y}"
    end
=end

