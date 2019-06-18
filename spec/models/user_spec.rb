require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(name: "Example User",
        email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end
  
  it "is valid with name and email" do
      expect(@user).to be_valid
  end
    
  it "is invalid without name" do
      @user.name = ""
      expect(@user).to be_invalid
  end
    
  it "is invalid without email" do
      @user.email = ""
      expect(@user).to be_invalid
  end
    
  it "is invalid with long name" do
      @user.name = "a" * 26
      expect(@user).to be_invalid
  end
  
  it "is invalid with long email" do
      @user.email = "a" * 244 + "@example.com"
      expect(@user).to be_invalid
  end
  
  it "rejects invalid email address " do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      expect(@user).to be_invalid, "#{invalid_address.inspect} should be invalid"
    end
  end
    
  it "rejects un-unique email address " do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    expect(duplicate_user).to be_invalid
  end
  
  it "save email addresses as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    expect(mixed_case_email.downcase).to eq @user.reload.email
  end
  
  it "doesnt save blank email addresses" do
    @user.password = @user.password_confirmation = " " * 6
    expect(@user).to be_invalid
  end
  
  it "doesnt save short email addresses" do
    @user.password = @user.password_confirmation = "a" * 5
    expect(@user).to be_invalid
  end
  
    
end
