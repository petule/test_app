  # test "the truth" do
  #   assert true
  # end

require 'test_helper'

class WebsiteTest < ActiveSupport::TestCase

  def setup
    @website = Website.new(weburl: "https://www.example.com", email: "user@example.com")
  end

  test "should be valid" do
    assert @website.valid?
  end
  
  test "website url should be present" do
    @website.weburl = ""
    assert_not @website.valid?
  end

  test "email should be present" do
    @website.email = "     "
    assert_not @website.valid?
  end 
  
  test "website url should not be longer than 255a" do
    @website.weburl = "a" * 256
    assert_not @website.valid?
  end

  test "email should not be longer than 180a" do
    @website.email = "a" * 179 + "@example.com"
    assert_not @website.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @website.email = valid_address
      assert @website.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "website url should be unique" do
    duplicate_website = @website.dup
    duplicate_website.weburl = @website.weburl.upcase
    @website.save
    assert_not duplicate_website.valid?
  end
  
  test "website url should be saved as lower-case" do
    mixed_case_weburl = "ExAMPLE.COm"
    @website.weburl = mixed_case_weburl
    @website.save
    assert_equal mixed_case_weburl.downcase, @website.reload.weburl
  end  
end
  

