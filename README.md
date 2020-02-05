Vet Management App:

To Run the Application:

1. Run the vet_app.rb file
2. Navigate through the different pages
3. All files for the project are shown in the relevant folders (models, views, public, etc.)


The Brief:

A veterinary practice has approached you to build a web application to help them manage their animals and vets. A vet may look after many animals at a time. An animal is registered with only one vet.

MVP
The practice wants to be able to register / track animals. Important information for the vets to know is -

  Name

  Date Of Birth (use a VARCHAR initially)

  Type of animal

  Contact details for the owner

  Treatment notes

  Be able to assign animals to vets

  CRUD actions for vets / animals - remember the user - what would they want to see on each View? What Views should there be?

Possible Extensions

  Mark owners as being registered/unregistered with the Vet. unregistered owners won’t be able to add any more animals.

  If an owner has multiple animals we don’t want to keep updating contact details separately for each pet. Extend your application to reflect that an owner can have many pets and to more sensibly keep track of owners’ details (avoiding repetition / inconsistencies)

  Handle check-in / check-out dates

  Let the practice see all animals currently in the practice (today’s date is between the check-in and check-out?)

  Sometimes an owner does not know the DOB. Allow them to enter an age instead. Try and make sure this always up to date - ie if they visit again a year from now a 3 yr old dog is now 4.

  Add extra functionality of your choosing - assigning treatments, a more comprehensive way of maintaining treatment notes over time. Appointments. Pricing / billing.


Technologies Used:

1. Atom
2. Github
3. Ruby
4. Sinatra
5. Pry
6. PostgreSQL
7. SQL
8. MiniTest
