require "sinatra"
require "sinatra/reloader"

get("/howdy") do
  erb(:hello)
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  erb(:square_results)
end

get("/") do
  erb(:homepage)
end
