require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/appointment.rb')

class AppointmentTest < MiniTest::Test

  def setup
    @appointment = Appointment.new(
      {
      "id" => "1",
      "check_in" => "2020/1/4",
      "check_out" => "2020/1/7",
      "pet_id" => "1"
      }
    )
  end

  def test_id
    assert_equal(1, @appointment.id)
  end

  def test_check_in
    assert_equal("2020/1/4", @appointment.check_in)
  end

  def test_check_out
    assert_equal("2020/1/7", @appointment.check_out)
  end

  def test_pet_id
    assert_equal(1, @appointment.pet_id)
  end
end
