module Factory
  
  DEFAULT_FIXTURE_FILENAME = 'gray_guitars.jpg'
  
  def self.create_attfu_image(filename = DEFAULT_FIXTURE_FILENAME, options = {})
    AttfuImage.create(:uploaded_data => upload_image(filename, options))
  end
  
  def self.upload_image(filename = DEFAULT_FIXTURE_FILENAME, options = {})
    options.reverse_merge! :file_dir => "#{RAILS_ROOT}/test/fixtures/files/", :mime_type => 'image/jpeg'
    ActionController::TestUploadedFile.new(options[:file_dir] + filename, options[:mime_type])
  end

end