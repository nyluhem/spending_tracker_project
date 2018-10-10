require( "sinatra" )
require( "sinatra/contrib/all" )
require( "pry-byebug" )
require_relative( "../models/merchant.rb" )
require_relative( "../models/tag.rb")
require_relative("../models/transaction.rb")
also_reload( "../models/*" )

#INDEX

get("/tags") do
  @tags = Tag.all
  erb(:"tags/index")
end

#NEW

get("/tags/new") do
  erb(:"tags/new")
end

#EDIT

get("/tags/:id/edit") do
  @tag = Tag.find(params[:id])
  erb(:"tags/edit")
end

#SHOW

get("/tags/:id") do
  @id = params[:id].to_i
  @tag = Tag.find(@id)
  @transactions = Transaction.all
  erb(:"tags/show")
end

#CREATE

post("/tags") do
  @tag = Tag.new(params)
  @tag.save
  redirect to "/tags"
end

#UPDATE

post("/tags/:id") do
  tag = Tag.new(params)
  tag.update
  redirect to "/tags"
end

#DELETE

post("/tags/:id/delete") do
  Tag.delete(params[:id])
  redirect to "/tags"
end
