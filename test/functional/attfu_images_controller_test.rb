require File.dirname(__FILE__) + '/../test_helper'

class AttfuImagesControllerTest < ActionController::TestCase
  
  def teardown
    AttfuImage.destroy_all
  end
  
  context "on GET to :index" do
    setup { get :index }
    
    should_respond_with :success
    should_assign_to :images
  end
  
  context "on GET to :show" do
    setup do
      image = Factory.create_attfu_image
      get :show, :id => image.id
    end
    
    should_respond_with :success
    should_assign_to :image
    should_render_template :show
  end
  
  context "on GET to :new" do
    setup { get :new }
    
    should_respond_with :success
    should_assign_to :image
  end
  
  context "on GET to :edit" do
    setup do
      image = Factory.create_attfu_image
      get :edit, :id => image.id
    end
    
    # should_respond_with :redirect
  end
  
  context "on POST to :create" do
    setup { post :create, :attfu_image => {:uploaded_data => Factory.upload_image} }
    
    should_assign_to :image
    should_redirect_to 'attfu_image_path(@image)'
    should_set_the_flash_to(/success/i)
  end
  
  context "on POST to :create with empty params" do
    setup { post :create, :attfu_image => {} }
    
    should_set_the_flash_to(/error/i)
    should_render_template :new
  end
  
  context "on PUT to :update" do
    setup do
      image = Factory.create_attfu_image
      @count = AttfuImage.count
      put :update, :id => image.id, :attfu_image => {:uploaded_data => Factory.upload_image('gray_eggs.jpg')}
    end
    
    should_assign_to :image
    should_redirect_to 'attfu_image_path(@image)'

    should "not change count" do
      assert_equal @count, AttfuImage.count
    end
  end
  
  should "not change count on :update" do
    image = Factory.create_attfu_image
    assert_no_difference 'AttfuImage.count' do
      put :update, :id => image.id, :attfu_image => {:uploaded_data => Factory.upload_image('gray_eggs.jpg')}
    end
  end

end
