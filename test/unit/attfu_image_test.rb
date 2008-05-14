require File.dirname(__FILE__) + '/../test_helper'

class AttfuImageTest < ActiveSupport::TestCase
  
  def teardown
    AttfuImage.destroy_all
  end
  
  should "create 3 images: original + 2 thumbnails" do
    assert_difference 'AttfuImage.count', 3, '3 images should be created: original + 2 thumbnails' do
      Factory.create_attfu_image
    end
  end
  
  should "add 1 to named_scope :originals" do
    assert_difference 'AttfuImage.originals.size' do
      Factory.create_attfu_image
    end
  end

  should "not create record for text file" do
    assert_no_difference 'AttfuImage.count' do
      Factory.create_attfu_image('test.txt', :mime_type => 'text/plain')
    end
  end
  
  context "An image" do
    setup { @image = Factory.create_attfu_image }
    
    should "be destroyed along with thumbnails" do
      assert_difference 'AttfuImage.count', -3 do
        @image.destroy
      end
    end
  end

end
