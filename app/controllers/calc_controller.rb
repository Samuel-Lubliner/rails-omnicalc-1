class CalcController < ApplicationController
  def square_new
    render({ :template => "calc_templates/square_new"})
  end

  def square_results
    @the_num = params.fetch("number").to_f
    @the_result = (@the_num ** 2).round(4)
    render({ :template => "calc_templates/square_results"})
  end

  def square_root_new
    render({ :template => "calc_templates/square_root_new"})
  end

  def square_root_results
    @the_num = params.fetch("number").to_f
  if @the_num < 0
    @error_message = "The number cannot be negative"
  else
    @the_result = Math.sqrt(@the_num)
  end
    render({ :template => "calc_templates/square_root_results"})
  end

  def payment_new
    render({ :template => "calc_templates/payment_new"})
  end
  def payment_results
    @apr = params.fetch("user_apr").to_f / 100
  @years = params.fetch("user_years").to_i
  @principal = params.fetch("user_pv").to_f
  if @apr <= 0 || @years <= 0 || @principal <= 0
    @error_message = "APR, years and principal must be greater than zero"
  else
    r = @apr / 12
    n = @years * 12
    numerator = r * @principal
    denominator = 1 - (1 + r)**-n
    @monthly_payment = (numerator / denominator).round(2)
    @apr = ActiveSupport::NumberHelper.number_to_percentage(@apr * 100, precision: 4)
    @principal = ActiveSupport::NumberHelper.number_to_currency(@principal)
    @monthly_payment = ActiveSupport::NumberHelper.number_to_currency(@monthly_payment)
  end
    render({ :template => "calc_templates/payment_results"})
  end

  def random_new
    render({ :template => "calc_templates/random_new"})


  end



  def random_results
    @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f
  if @min >= @max
    @error_message = "Minimum value must be less than maximum value"
  else
    @random_number = rand(@min..@max)
  end
    render({ :template => "calc_templates/random_results"})
  end
  

end
