require( "sinatra" )
require( "sinatra/contrib/all" )
require( "pry-byebug" )
require_relative( "../models/merchant.rb" )
require_relative( "../models/tag.rb")
require_relative("../models/transaction.rb")
require_relative("../models/budget.rb")
also_reload( "../models/*" )


#INDEX

get("/budgets") do
  @budgets = Budget.all
  erb(:"budgets/index")
end

#NEW

get("/budgets/new") do
  @tags = Tag.all
  erb(:"budgets/new")
end

#EDIT

get("/budgets/:id/edit") do
  @budget = Budget.find(params[:id])
  erb(:"budgets/edit")
end

#SHOW

get("/budgets/:id") do
  @id = params[:id].to_i
  @budget = Budget.find(@id)
  @budgets = Budget.all
  erb(:"budgets/show")
end

#CREATE

post("/budgets") do
  @budget = Budget.new(params)
  @budget.save
  redirect to ("/budgets")
end

#UPDATE

post("/budgets/:id") do
  @budget = Budget.new(params)
  @budget.update
  redirect to "/budgets"
end

#DELETE

post("/budgets/:id/delete") do
  Budget.delete(params[:id])
  redirect to "/budgets"
end
