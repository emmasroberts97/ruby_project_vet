require_relative('../models/owner.rb')
require_relative('../models/pet.rb')
require_relative('../models/vet.rb')

require('pry')

Vet.delete_all()
Owner.delete_all()
Pet.delete_all()

owner1 = Owner.new({"name" => "Emma","contact_number" => "12345678910","registration" => "Registered","url" => "/images/owners/Emma.png"})
owner2 = Owner.new({"name" => "Gayle","contact_number" => "10987654321","registration" => "Registered", "url" => "/images/owners/Gayle.jpeg"})
owner3 = Owner.new({"name" => "Scott","contact_number" => "5432154321","registration" => "Not Registered", "url" => "/images/owners/Scott.png"})
owner1.save()
owner2.save()
owner3.save()

vet1 = Vet.new({"name" => "Dr. Rooney","experience" => 5,"url" => "/images/vets/Rooney.jpeg"})
vet2 = Vet.new({"name" => "Dr. Smith","experience" => 3,"url" => "/images/vets/Smith.png"})
vet3 = Vet.new({"name" => "Dr. Jones","experience" => 7,"url" => "/images/vets/Jones.jpeg"})
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
    "treatment_notes" => "Good boy!",
    "url" => "/images/pets/Ollie.jpeg"
  }
)

pet2 = Pet.new(
  {
    "name" => "Tessa",
    "dob" => "05/07/2004",
    "species" => "Dog",
    "owner_details" => owner1.id,
    "vet_details" => vet1.id,
    "treatment_notes" => "No treatment needed! She is healthy.",
    "url" => "/images/pets/Tessa.png"
  }
)

pet3 = Pet.new(
  {
    "name" => "Monkey",
    "dob" => "01/01/11",
    "species" => "Cat",
    "owner_details" => owner2.id,
    "vet_details" => vet2.id,
    "treatment_notes" => "Nails clipped and vaccinations given.",
    "url" => "/images/pets/Monkey.jpeg"
  }
)

pet4 = Pet.new(
  {
    "name" => "Pepper",
    "dob" => "01/01/12",
    "species" => "Cat",
    "owner_details" => owner2.id,
    "vet_details" => vet2.id,
    "treatment_notes" => "Nails clipped and vaccinations given.",
    "url" => "/images/pets/Pepper.jpeg"
  }
)

pet5 = Pet.new(
  {
    "name" => "Rodger",
    "dob" => "01/01/19",
    "species" => "Dog",
    "owner_details" => owner3.id,
    "vet_details" => vet3.id,
    "treatment_notes" => "Initial puppy vaccinations given.",
    "url" => "/images/pets/Rodger.png"
  }
)

pet6 = Pet.new(
  {
    "name" => "Lucy",
    "dob" => "01/01/19",
    "species" => "Dog",
    "owner_details" => owner3.id,
    "vet_details" => vet3.id,
    "treatment_notes" => "Initial puppy vaccinations given.",
    "url" => "/images/pets/Lucy.jpeg"
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
