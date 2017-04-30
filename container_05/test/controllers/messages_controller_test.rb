require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @message = messages(:one)
  end
  
  test "should get root" do
    get root_path
    assert_response :success
  end

  test "should get index" do
    get messages_url
    assert_response :success
  end

  test "should post create" do
    assert_difference 'Message.count', 1 do
      post messages_path, message: { name: 'taro',
                                  body: 'hello'}
    end
  end 
end
