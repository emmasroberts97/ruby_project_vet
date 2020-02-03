require_relative('../models/owner.rb')
require_relative('../models/pet.rb')
require_relative('../models/vet.rb')
require_relative('../models/appointment.rb')


require('pry')

Vet.delete_all()
Owner.delete_all()
Pet.delete_all()
Appointment.delete_all()

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
    "dob" => "2009/11/27",
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
    "dob" => "2004/07/05",
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
    "dob" => "2011/01/01",
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
    "dob" => "2012/01/01",
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
    "dob" => "2019/01/01",
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
    "dob" => "2019/01/01",
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


appointment1 = Appointment.new({"check_in" => Time.new(2019, 12, 1),"check_out" => Time.new(2019, 12, 3),"pet_id" => pet1.id})
appointment2 = Appointment.new({"check_in" => Time.new(2020, 2, 1), "check_out" => Time.new(2020, 2, 10), "pet_id" => pet3.id})
appointment3 = Appointment.new({"check_in" => Time.new(2020, 2, 3), "check_out" => Time.new(2020, 2, 7), "pet_id" => pet6.id})

appointment1.save()
appointment2.save()
appointment3.save()



binding.pry
nil
