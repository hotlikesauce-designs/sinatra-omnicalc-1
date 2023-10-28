require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_numb = params.fetch("users_number").to_f
  @the_result = @the_numb**2 
  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end
