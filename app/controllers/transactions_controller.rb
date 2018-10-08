require( "sinatra" )
require( "sinatra/contrib/all" )
require( "pry-byebug" )
require_relative( "../models/merchant.rb" )
require_relative( "../models/tag.rb")
require_relative("../models/transaction.rb")
also_reload( "../models/*" )

get("/transactions") do
  @transactions = Transaction.all
  erb(:"transactions/index")
end

get("/transactions/new") do
  erb(:"transactions/new")
end

get("/transactions/:id") do
  @id = params[:id].to_i
  @transaction = Transaction.find(@id)
  erb(:"transactions/show")
end
