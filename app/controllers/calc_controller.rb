class CalcController < ApplicationController
  def square_new
    render({ :template => "calc_templates/square_new"})
  end

  def square_results
    render({ :template => "calc_templates/square_results"})

  end


end
