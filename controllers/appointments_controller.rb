require('sinatra')
require('sinatra/contrib/all')
require( 'pry-byebug' )
require_relative( '../models/pet.rb' )
require_relative('../models/appointment.rb')
also_reload( '../models/*' )

get '/appointments/new' do
  @pets = Pet.all()
  erb(:"appointments/new")
end

post '/appointments' do
  @appointment = Appointment.new(params)
  @appointment.save()
  redirect to('/pets')
end
