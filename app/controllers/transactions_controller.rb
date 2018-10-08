require( "sinatra" )
require( "sinatra/contrib/all" )
require( "pry-byebug" )
require_relative( "../models/merchant.rb" )
require_relative( "../models/tag.rb")
require_relative("../models/transaction.rb")
also_reload( "../models/*" )

#INDEX

get("/transactions") do
  @transactions = Transaction.all
  erb(:"transactions/index")
end

#NEW

get("/transactions/new") do
    @merchants = Merchant.all
    @tags = Tag.all
  erb(:"transactions/new")
end

#EDIT

get("/transactions/:id/edit") do
  @merchants = Merchant.all
  @tags = Tag.all
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/edit")
end

#SHOW

get("/transactions/:id") do
  @id = params[:id].to_i
  @transaction = Transaction.find(@id)
  erb(:"transactions/show")
end

#CREATE

post("/transactions") do
  @transaction = Transaction.new(params)
  @transaction.save
  redirect to "/transactions"
end

# UPDATE

post("/transactions/:id") do
  transaction = Transaction.new(params)
  transaction.update
  redirect to "/transactions"
end
