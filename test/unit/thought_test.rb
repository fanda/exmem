require 'test_helper'

class ThoughtTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Thought.new.valid?
  end
end
