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
      p tag
      label = Tag.create(name: tag)
      p link.tags << label
    end
    # tag = Tag.first_or_create(name: params[:tags])

    link.save
    redirect '/links'
  end

  get '/tags/' do
    tag = Tag.all(name: params[:name])
    @links = tag ? tag.links : []
    erb :index
  end

  run! if app_file == $0
end
