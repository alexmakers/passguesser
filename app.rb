require 'sinatra'
require 'sinatra/json'

get '/' do
  erb :index
end

post '/guess' do
  # puts 'Guess was requested'
  if params[:password] == 'letmein'
    json message: 'Success', time: Time.now
  else
    json message: 'Failure', time: Time.now
  end
end