require 'sinatra'
require 'sinatra/reloader'

get '/' do
  prng = Random.new
  SECRET_NUMBER = prng.rand(3)
  str_guess =  params["guess"]
  message = check_guess(str_guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

def check_guess(str_guess)
  if !str_guess.nil? && !str_guess.empty?
    i_guess = str_guess.to_i
    if i_guess > SECRET_NUMBER
      "Too high!"
    elsif i_guess == SECRET_NUMBER
      "You got it right!"
    else
      "Too low!"
    end
  end
end