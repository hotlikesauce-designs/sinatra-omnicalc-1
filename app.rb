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

get("/square_root/results") do
  @the_numb = params.fetch("users_number").to_f
  @the_result = @the_numb**(0.5) 
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:new_payment_calc)
end

get("/payment/results") do
  
  def format_currency_with_commas(amount)
    parts = sprintf("%.2f", amount).split('.')
    parts[0].gsub!(/(\d)(?=(\d{3})+(?!\d))/, '\\1,')
    "$#{parts.join('.')}"
  end

  @the_apr = params.fetch("user_apr").to_f/100
  @formatted_percentage = sprintf("%.4f%%", @the_apr * 100)

  @the_years = params.fetch("user_years").to_i

  @the_principal = params.fetch("user_pv").to_f
  @formatted_principal = sprintf("$%.2f", @the_principal)


  def calculate_monthly_payment(apr, years_remaining, present_value)
    monthly_interest_rate = (@the_apr) / 12
    total_number_of_payments = @the_years * 12
  
    if monthly_interest_rate == 0
      monthly_payment = present_value / total_number_of_payments
    else
      monthly_payment = present_value * (monthly_interest_rate * (1 + monthly_interest_rate) ** total_number_of_payments) / ((1 + monthly_interest_rate) ** total_number_of_payments - 1)
    end
  
    return monthly_payment
  end

  @the_payment = calculate_monthly_payment(@the_apr, @the_years, @the_principal)
  @formatted_payment = format_currency_with_commas(@the_payment)

  erb(:payment_results)
end

