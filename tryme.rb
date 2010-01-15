# Let's figure out how to handle arrays of photos
#  as well as hashes.

# populate an array of jpg files

require 'exifr'
f_array = Dir[File.join('C:/exif/rubyexif/lib',"**/*.jpg")]

h1 = { }
photo_hash = {}
f_array.each do |file|
            exposure_time_stamp = EXIFR::JPEG.new(file).date_time
            if h1.has_key?(exposure_time_stamp)
              ts_index = h1[exposure_time_stamp].size + 1
              h1[exposure_time_stamp] = h1[exposure_time_stamp].merge(ts_index=> file, "duplicate"=>true)
            else
              h1[exposure_time_stamp] = {1=>file,"duplicate"=> false}
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

