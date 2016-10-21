ENV["RACK_ENV"] ||=  "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Bookmark < Sinatra::Base

enable :sessions
set :session_secret, 'super secret'

  get '/' do
    erb :homepage
  end

  get '/links' do
    @links = Link.all
    erb :index
    end

  post '/add_user_data' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect "/links"
  end


  get '/links/new' do
    erb :create_links
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tags].split.each do |tag|
      link.tags << Tag.first_or_create(tag: tag)
    end
    p link.tags
    link.save
    redirect '/links'
  end

  get '/tags' do
    redirect "/tags/#{params[:filter]}"
  end

  get '/tags/:filter' do
    tag = Tag.first(tag: params[:filter])
    @links = tag ? tag.links : []
    erb :index
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
