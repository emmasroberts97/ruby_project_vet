require('sinatra')
require('sinatra/contrib/all')
require('date')
require('pry-byebug')
require_relative('../models/pet.rb')
require_relative('../models/owner.rb')
require_relative('../models/vet.rb')
also_reload('../models/*')

get '/pets' do
  @pets = Pet.all()
  erb(:"pets/index")
end

get '/pets/new' do
  @vets = Vet.all()
  @owners = Owner.all()
  @pets = Pet.all()
  erb(:"pets/new")
end

post '/pets' do
  @pet = Pet.new(params)
  @pet.save()
  redirect to('/pets')
end

get '/pets/:id' do
  @pet = Pet.find(params[:id])
  erb(:"pets/show")
end

get '/pets/:id/edit' do
  @owners = Owner.all()
  @vets = Vet.all()
  @pet = Pet.find(params[:id])
  erb(:"pets/edit")
end

post '/pets/:id' do
  @pet = Pet.new(params)
  @pet.update_pet()
  redirect to('/pets')
end

post '/pets/:id/delete' do
  @pet = Pet.find(params[:id])
  @pet.delete()
  redirect to('/pets')
end
