class AttfuImage < ActiveRecord::Base
  has_attachment :content_type => :image,
                 :thumbnails => {:small => '124', :medium => '248'},
                 :path_prefix => (ENV['RAILS_ENV'] == 'test' ? 'public/test/' : 'public/') + "#{table_name}"
                 
  validates_as_attachment
  named_scope :originals, :conditions => {:parent_id => nil}
end
