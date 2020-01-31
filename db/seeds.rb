require_relative('../models/owner.rb')
require_relative('../models/pet.rb')
require_relative('../models/vet.rb')

require('pry')

Vet.delete_all()
Owner.delete_all()
Pet.delete_all()

owner1 = Owner.new({"name" => "Emma","contact_number" => "12345678910"})
owner2 = Owner.new({"name" => "Gayle","contact_number" => "10987654321"})
owner3 = Owner.new({"name" => "Scott","contact_number" => "5432154321"})
owner1.save()
owner2.save()
owner3.save()

vet1 = Vet.new({"name" => "Dr. Rooney","experience" => 5})
vet2 = Vet.new({"name" => "Dr. Smith","experience" => 3})
vet3 = Vet.new({"name" => "Dr. Jones","experience" => 7})
vet1.save()
vet2.save()
vet3.save()

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

pet2 = Pet.new(
  {
    "name" => "Tessa",
    "dob" => "05/07/2004",
    "species" => "Dog",
    "owner_details" => owner1.id,
    "vet_details" => vet1.id,
    "treatment_notes" => "No treatment needed! She is healthy."
  }
)

pet3 = Pet.new(
  {
    "name" => "Monkey",
    "dob" => "01/01/11",
    "species" => "Cat",
    "owner_details" => owner2.id,
    "vet_details" => vet2.id,
    "treatment_notes" => "Nails clipped and vaccinations given."
  }
)

pet4 = Pet.new(
  {
    "name" => "Pepper",
    "dob" => "01/01/12",
    "species" => "Cat",
    "owner_details" => owner2.id,
    "vet_details" => vet2.id,
    "treatment_notes" => "Nails clipped and vaccinations given."
  }
)

pet5 = Pet.new(
  {
    "name" => "Rodger",
    "dob" => "01/01/19",
    "species" => "Dog",
    "owner_details" => owner3.id,
    "vet_details" => vet3.id,
    "treatment_notes" => "Initial puppy vaccinations given."
  }
)

pet6 = Pet.new(
  {
    "name" => "Lucy",
    "dob" => "01/01/19",
    "species" => "Dog",
    "owner_details" => owner3.id,
    "vet_details" => vet3.id,
    "treatment_notes" => "Initial puppy vaccinations given."
  }
)

pet1.save()
pet2.save()
pet3.save()
pet4.save()
pet5.save()
pet6.save()



binding.pry
nil
