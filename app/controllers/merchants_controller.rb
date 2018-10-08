require( "sinatra" )
require( "sinatra/contrib/all" )
require( "pry-byebug" )
require_relative( "../models/merchant.rb" )
require_relative( "../models/tag.rb")
require_relative("../models/transaction.rb")
also_reload( "../models/*" )

get("/merchants") do
  @merchants = Merchant.all
  erb(:"merchants/index")
end

get("/merchants/new") do
  erb(:"merchants/new")
end

get("/merchants ")
