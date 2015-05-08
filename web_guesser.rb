require 'sinatra'
require 'sinatra/reloader'

get '/' do
  prng = Random.new
  SECRET_NUMBER = prng.rand(3)
  str_guess =  params["guess"]
  message = check_guess(str_guess)
  color = "green"
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :color => color}
end

def check_guess(str_guess)
  if !str_guess.nil? && !str_guess.empty?
    i_guess = str_guess.to_i
    if i_guess > SECRET_NUMBER
      color = "red"
      "Too high!"
    elsif i_guess == SECRET_NUMBER
      color = "green"
      "You got it right!"
    else
      color = "blue"
      "Too low!"
    end
  end
end