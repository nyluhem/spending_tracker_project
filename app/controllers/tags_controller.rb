require( "sinatra" )
require( "sinatra/contrib/all" )
require( "pry-byebug" )
require_relative( "../models/merchant.rb" )
require_relative( "../models/tag.rb")
require_relative("../models/transaction.rb")
also_reload( "../models/*" )

get("/tags") do
  @tags = Tag.all
  erb(:"tags/index")
end

get("/tags/new") do
  erb(:"tags/new")
end

post("/tags") do
  @tag = Tag.new(params)
  @tag.save
  redirect to "/tags"
end
