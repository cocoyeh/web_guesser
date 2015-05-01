require 'sinatra'
require 'sinatra/reloader'

get '/' do
  prng = Random.new
  number = prng.rand(100)
  erb :index, :locals => {:number => number}
end