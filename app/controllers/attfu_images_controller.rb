class AttfuImagesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:update]
  
  def index
    @images = AttfuImage.originals
  end
  
  def show
    @image = AttfuImage.find(params[:id])
  end
  
  def new
    @image = AttfuImage.new
  end
  
  def edit
    @image = AttfuImage.find(params[:id])
    redirect_to EditableImage::Picnik.url(@image.full_filename, picnik_params)
  end
  
  def create
    @image = AttfuImage.new(params[:attfu_image])
    if @image.save
      flash[:notice] = 'Image was successfully uploaded and saved.'
      redirect_to attfu_image_path(@image)
    else
      flash[:error] = 'There was an error saving the image.'
      render :action => :new
    end
  end
  
  def update
    @image = AttfuImage.find(params[:id])
    if @image.update_attributes(params[:attfu_image])
      flash[:notice] = 'Image was successfully updated.'
    else
      flash[:error] = 'There was an error updating the image.'
    end
    redirect_to attfu_image_path(@image.reload)
  end
  
  def destroy
    @image = AttfuImage.find(params[:id])
    @image.destroy
    redirect_to attfu_images_path
  end
  
  private
  
  def picnik_params
    { # required
      :apikey => 'YOUR_API_KEY_HERE',
      # not required by Picnik, but needed to save images back
      :export => "http://YOUR_URL_HERE/attfu_images/#{@image.id}", 
      :export_field => 'attfu_image[uploaded_data]',
      # not required
      :exclude => 'in,out', 
      # not required, but needed for resource routing to work
      '_method' => 'put' }
  end
  
end
