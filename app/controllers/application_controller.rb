class ApplicationController < ActionController::Base

  def blank_square_form
    render({:template => "calculation_templates/square_form.html.erb"})
  end

  def calculate_square

    @num = params.fetch("user_input")
    @square = (@num.to_f ** 2)
    render({:template => "calculation_templates/square_results.html.erb"})
  end

  def blank_root_form
    render({:template => "calculation_templates/root_form.html.erb"})
  end

  def calculate_root

    @num = params.fetch("user_input")
    @root = @num.to_f ** (1/2.0)
    render({:template => "calculation_templates/root_results.html.erb"})
  end

  def blank_payment_form
    render({:template => "calculation_templates/payment_form.html.erb"})
  end

  def calculate_payment

    @apr = params.fetch("user_apr").to_f
    @years = params.fetch("user_years")
    @principal = params.fetch("user_principal").to_f
    @r = @apr/1200
    @payment = (@r*@principal)/(1-(1+@r)**(-12*@years.to_f))
    render({:template => "calculation_templates/payment_results.html.erb"})
  end

  def blank_random_form
    render({:template => "calculation_templates/rand_form.html.erb"})
  end

  def calculate_random

    @min = params.fetch("user_min").to_f
    @max = params.fetch("user_max").to_f

    @result = rand(@min..@max)
    render({:template => "calculation_templates/rand_results.html.erb"})
  end

end
