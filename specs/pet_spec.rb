require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/pet.rb')

class PetTest < MiniTest::Test

  def setup
    @pet = Pet.new(
      {
        "id" => "1",
        "name" => "Ollie",
        "dob" => "27/11/09",
        "species" => "Dog",
        "owner_details" => "1",
        "vet_details" => "1",
        "treatment_notes" => "Nothing needed. He's a good boy!"
      }
    )
  end

  def test_name
    assert_equal("Ollie", @pet.name)
  end

  def test_dob
    assert_equal("27/11/09", @pet.dob)
  end

  def test_species
    assert_equal("Dog", @pet.species)
  end

  def test_owner_details
    assert_equal(1, @pet.owner_details)
  end

  def test_vet_details
    assert_equal(1, @pet.vet_details)
  end

  def test_treatment_notes
    assert_equal("Nothing needed. He's a good boy!", @pet.treatment_notes)
  end

  def test_id
    assert_equal(1, @pet.id)
  end
  
end
