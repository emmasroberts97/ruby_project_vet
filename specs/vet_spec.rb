require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/vet.rb')

class VetTest < MiniTest::Test

  def setup
    @vet = Vet.new(
      {
        "id" => "1",
        "name" => "Dr. Rooney",
        "experience" => 5
      }
    )
  end

  def test_name
    assert_equal("Dr. Rooney", @vet.name)
  end

  def test_id
    assert_equal(1, @vet.id)
  end

  def test_experience
    assert_equal(5, @vet.experience)
  end 

end
