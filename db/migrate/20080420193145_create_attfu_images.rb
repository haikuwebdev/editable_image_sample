class CreateAttfuImages < ActiveRecord::Migration
  def self.up
    create_table :attfu_images do |t|
      t.integer :parent_id, :size, :width, :height
      t.string :filename, :content_type, :thumbnail
      t.timestamps
    end
  end

  def self.down
    drop_table :attfu_images
  end
end
