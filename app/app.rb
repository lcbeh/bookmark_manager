ENV["RACK_ENV"] ||=  "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Bookmark < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :index
    end

  get '/links/new' do
    erb :create_links
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tags].split.each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    p link.tags
    link.save
    redirect '/links'
  end

  get '/tags' do
    redirect "/tags/#{params[:filter]}"
  end

  get '/tags/:filter' do
    tag = Tag.first(name: params[:filter])
    @links = tag ? tag.links : []
    erb :index
  end

  run! if app_file == $0
end
