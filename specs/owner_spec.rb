require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/owner.rb')

class OwnerTest < MiniTest::Test

  def setup
    @owner = Owner.new(
      {
        "id" => "1",
        "name" => "Emma",
        "contact_number" => "12345678910"
      }
    )
  end

  def test_name
    assert_equal("Emma", @owner.name)
  end

  def test_contact_number
    assert_equal("12345678910", @owner.contact_number)
  end

  def test_id
    assert_equal(1, @owner.id)
  end

end
