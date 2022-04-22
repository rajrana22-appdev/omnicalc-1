class ApplicationController < ActionController::Base
  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb" })
  end

  def calculate_square
    @num = params.fetch("number").to_f
    @square_of_num = @num ** 2
    render({ :template => "calculation_templates/square_results.html.erb" })
  end

  def blank_root_form
    render({ :template => "calculation_templates/root_form.html.erb" })
  end

  def calculate_root
    @num = params.fetch("number").to_f
    @root_of_num = Math.sqrt(@num)
    render({ :template => "calculation_templates/root_results.html.erb" })
  end

  def blank_payment_form
    render({ :template => "calculation_templates/payment_form.html.erb" })
  end

  def calculate_payment
    @apr = params.fetch("apr").to_f
    @show_apr = @apr.to_s(:percentage, { :precision => 4 })
    @num_years = params.fetch("year").to_i
    @principal = params.fetch("principal").to_f
    @show_principal = @principal.to_s(:currency)
    @n = 12 * @num_years
    @r = (@apr / 100) / 12
    @payment = (@r * @principal) / (1 - (1 + @r) ** -(@n))
    @show_payment = @payment.to_s(:currency)
    render({ :template => "calculation_templates/payment_results.html.erb" })
  end

  def blank_random_form
    render({ :template => "calculation_templates/rand_form.html.erb" })
  end

  def calculate_random
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper)
    render({ :template => "calculation_templates/rand_results.html.erb" })
  end
end
