require 'test_helper'

class PhoneNumberTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert PhoneNumber.new.valid?
  end
end
