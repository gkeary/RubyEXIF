require 'exifr'

# populate an array with all of the jpg files
f_array = Dir[File.join('C:/exif/rubyexif/lib',"**/*.jpg")]

def show_filename(pix_path)
  file_name = File::basename(pix_path)
  return file_name
end

def show_folder(pix_path)
  folder = File::dirname(pix_path).split('/')[-1]
  return folder
end

def populate_hash (f_array)
    h1={}
    first_pass = f_array.each do |pix_path|
    snap_time = EXIFR::JPEG.new(pix_path).date_time

    if h1.has_key?(snap_time)
      ts_index = h1[snap_time].size + 1
      hh= h1[snap_time]
      h1[snap_time] = hh.merge(ts_index=> pix_path)
    else
      h1[snap_time] = {1=>pix_path}
    end
  end
  return h1
end

def transform_hash (hh = {})
  a=0; result={}
  hh.each do |x, y|
    a += 1
    pk = "k#{a}"
    v1= {"taken_at" => x}
    v2= v1.merge(y)
    result = result.merge(pk => v2)
  end
  return result
 end

first_pass = populate_hash(f_array)
photo_hash = transform_hash(first_pass)
puts "Pix count(unique): #{photo_hash.size}"
puts photo_hash.sort.to_yaml

