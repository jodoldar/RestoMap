# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Josep Dols', email: 'josepdd@gmail.com',
                     password: 'foopass', password_confirmation: 'foopass')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = ''
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = ''
    assert_not @user.valid?
  end

  test "name shouln't be too long" do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end

  test "email shouln't be too long" do
    @user.email = 'a' * 244 + '@testmail.com'
    assert_not @user.valid?
  end

  test 'email validation should accept valid addresses' do
    # Set of valid email addresses
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    # Check validity of each of them
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test 'email validation should reject invalid addresses' do
    # Set of invalid email addresses
    invalid_addresses = %w[foo@bar+baz.com user@example,com user_at_foo.org
                           foo@bar_baz.com user.name@example.]
    # Check that each of them is not valid
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test 'email addresses should be unique' do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'email addresses should be unique w/ uppercase' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'password should be present (nonblank)' do
    @user.password = @user.password_confirmation = ' ' * 6
    assert_not @user.valid?
  end

  test 'password should have a minimum length' do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end
end
