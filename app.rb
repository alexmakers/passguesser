require 'sinatra'
require 'sinatra/json'

dictionary = File.readlines('/usr/share/dict/words').map(&:chomp)

get '/' do
  erb :index
end

get '/autocomplete' do
  suggestions = dictionary.select { |word| 
    word.start_with? params[:text] 
  }.first(5)

  json suggestions
end

post '/guess' do
  # puts 'Guess was requested'
  if params[:password] == 'letmein'
    json message: 'Success', time: Time.now
  else
    json message: 'Failure', time: Time.now
  end
end