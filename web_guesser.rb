require 'sinatra'
require 'sinatra/reloader'

get '/' do
  prng = Random.new
  secret_number = prng.rand(100)
  "The SECRET NUMBER is #{secret_number}"
end