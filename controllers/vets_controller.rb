require('sinatra')
require('sinatra/contrib/all')
require( 'pry-byebug' )
require_relative( '../models/pet.rb' )
require_relative( '../models/owner.rb' )
require_relative( '../models/vet.rb' )
also_reload( '../models/*' )

get '/vets' do
  @vets = Vet.all()
  erb(:"vets/index")
end

get '/vets/new' do
  erb(:"vets/new")
end

post '/vets' do
  @vet = Vet.new(params)
  @vet.save()
  redirect to('/vets')
end

# get '/vets/:id' do
#   @vet = Vet.find(params[:id])
#   erb(:"vets/show")
# end

get '/vets/:id/edit' do
  @vet = Vet.find(params[:id])
  erb(:"vets/edit")
end

post '/vets/:id' do
  @vet = Vet.new(params)
  @vet.update_details()
  redirect to('/vets')
end

post '/vets/:id/delete' do
  @vet = Vet.find(params[:id])
  @vet.delete()
  redirect to('/vets')
end
