class Content < ActiveRecord::Base
  attr_accessible :name, :order, :info, :kind, :project_id, :section_id, :photo
  validates_inclusion_of :kind, :in => [ 'text', 'image'],
  :message => "must be one of Text or Image."
 
  belongs_to :project
  
   validates_existence_of :project
   after_save :store_photo
   
   
   # after the person has been written to the database, deal with
# writing any image data to the filesystem

# File.join is a cross-platform way of joining directories;
# we could have written "#{Rails.root}/public/photo_store"
PHOTO_STORE = File.join Rails.root, 'public', 'photo_store'
# where to write the image file to
def photo_filename
File.join PHOTO_STORE, "#{info}"
end
# return a path we can use in HTML for the image
def photo_path
"/photo_store/#{info}"
end
 
# when photo data is assigned via the upload, store the file data
# for later and assign the file extension, e.g., ".jpg"
def photo=(file_data)
  unless file_data.blank?
  # store the uploaded data into a private instance variable
  @file_data = file_data
  # figure out the last part of the filename and use this as
  # the file extension. e.g., from "me.jpg" will return "jpg"
  self.info = file_data.original_filename
  end
end 
    
  
private
# called after saving, to write the uploaded image to the filesystem
def store_photo
  if self.kind=='image'
    if @file_data
    # make the photo_store directory if it doesn't exist already
    FileUtils.mkdir_p PHOTO_STORE
    # write out the image data to the file
    File.open(photo_filename, 'wb') do |f|
    f.write(@file_data.read)
    end
    # ensure file saved only when it newly arrives at model being saved
    @file_data = nil
    self.info=photo_filename
    end
  end
end


   
end

