require_relative('../models/owner.rb')
require_relative('../models/pet.rb')
require_relative('../models/vet.rb')

require('pry')

Vet.delete_all()
Owner.delete_all()
Pet.delete_all()

owner1 = Owner.new(
  {
    "name" => "Emma",
    "contact_number" => "12345678910"
  }
)

owner1.save()

vet1 = Vet.new(
  {
    "name" => "Dr. Rooney",
    "experience" => 5
  }
)

vet1.save()

# vet1.name = "Dr. Smith"
# vet1.update_details()

pet1 = Pet.new(
  {
    "name" => "Ollie",
    "dob" => "27/11/09",
    "species" => "Dog",
    "owner_details" => owner1.id,
    "vet_details" => vet1.id,
    "treatment_notes" => "Good boy!"
  }
)

pet1.save()





binding.pry
nil
