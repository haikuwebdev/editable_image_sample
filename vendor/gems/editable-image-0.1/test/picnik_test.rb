require File.dirname(__FILE__) + '/../lib/picnik'
require 'test/unit'
require 'shoulda'

class PicnikTest < Test::Unit::TestCase
  
  # TODO: test response
  # TODO: test bad filename passed to url
  # TODO: test non-image filename passed to url
  # TODO: exception for not passing apikey to parameters?
  
  context "Request parameters" do
    setup do
      def Picnik.public_request_parameters(*args)
        request_parameters(*args)
      end
      @file = File.open("files/logo.gif")
      parameters = {:apikey => 'this_is_a_test_picnik_apikey'}
      @request_parameters = Picnik.public_request_parameters(@file, parameters)
    end
    
    teardown do
      @file.close
    end
    
    should "include _import with correct value" do
      assert @request_parameters.keys.include?('_import')
    end
    
    should "have correct value for _import" do
      assert_equal 'image_data', @request_parameters['_import']
    end
    
    should "include image_data" do
      assert @request_parameters.keys.include?('image_data')
    end
    
    should "not have nil image_data" do
      assert_not_nil @request_parameters['image_data']
    end    
  end
  
  context "Parameter key" do
    setup do
      def Picnik.public_parameter_key(*args)
        parameter_key(*args)
      end
    end
    
    should "be stringified" do
      assert_equal 'foo', Picnik.public_parameter_key(:foo)
    end
    
    should "add underscore for Picnik API parameter" do
      assert_equal '_apikey', Picnik.public_parameter_key(:apikey)
    end
    
    should "not add underscore for non-Picnik API parameter" do
      assert_equal 'foo', Picnik.public_parameter_key('foo')
    end
    
    should "not add underscore for Picnik API parameter that already has one" do
      assert_equal '_apikey', Picnik.public_parameter_key('_apikey')
    end
    
    should "keep underscore for non Picnik API parameter" do
      assert_equal '_method', Picnik.public_parameter_key('_method')
    end
  end
  
  
  
end