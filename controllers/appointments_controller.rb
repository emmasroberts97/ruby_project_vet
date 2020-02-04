require('sinatra')
require('sinatra/contrib/all')
require( 'pry-byebug' )
require('date')
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
  redirect to('/appointments')
end

get '/appointments' do
  @appointments = Appointment.all()
  erb(:"appointments/index")
end

get '/appointments/:id/edit' do
  @pets = Pet.all()
  @appointment = Appointment.find(params[:id])
  erb(:"appointments/edit")
end

post '/appointments/:id' do
  @appointment = Appointment.new(params)
  @appointment.update()
  redirect to('/appointments')
end

post '/appointments/:id/delete' do
  @appointment = Appointment.find(params[:id])
  @appointment.delete()
  redirect to('/appointments')
end
