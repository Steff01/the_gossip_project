require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index , locals: {gossips: Gossip.all}
  end

  get '/gossips/:x' do
    @x=params[:x]
    @single=Gossip.single(@x.to_i)
    erb :index_gossip
    
  end

  get '/gossips/all/' do
    erb :all_gossip
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
   Gossip.new(params[:gossip_author], params[:gossip_content]).save
   redirect '/'
  end




end