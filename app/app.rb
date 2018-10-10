require( "sinatra" )
require( "sinatra/contrib/all")
require_relative("./controllers/merchants_controller.rb")
require_relative("./controllers/tags_controller.rb")
require_relative("./controllers/transactions_controller.rb")
require_relative("./controllers/budget_controller.rb")
also_reload('./controllers/*')



get '/' do
  erb(:index)
end
