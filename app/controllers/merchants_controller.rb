require( "sinatra" )
require( "sinatra/contrib/all" )
require( "pry-byebug" )
require_relative( "../models/merchant.rb" )
require_relative( "../models/tag.rb")
require_relative("../models/transaction.rb")
also_reload( "../models/*" )

#INDEX

get("/merchants") do
  @merchants = Merchant.all
  erb(:"merchants/index")
end

#NEW

get("/merchants/new") do
  erb(:"merchants/new")
end

#EDIT

get("/merchants/:id/edit") do
  @merchant = Merchant.find(params[:id])
  erb(:"merchants/edit")
end

#CREATE

post("/merchants") do
  @merchant = Merchant.new(params)
  @merchant.save
  redirect to ("/merchants")
end

#UPDATE

post("/merchants/:id") do
  merchant = Merchant.new(params)
  merchant.update
  redirect to "/merchants"
end

#DELETE

post("/merchants/:id/delete") do
  Merchant.delete(params[:id])
  redirect to "/merchants"
end
