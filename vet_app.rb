require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('date')
require_relative('controllers/owners_controller')
require_relative('controllers/pets_controller')
require_relative('controllers/vets_controller')
require_relative('models/appointment.rb')

get '/' do
  @appointments = Appointment.all()
  erb(:index)
end
