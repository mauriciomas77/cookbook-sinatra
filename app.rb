require_relative 'cookbook'
require_relative 'recipe'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry-byebug'
require 'better_errors'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get '/' do
  cookbook = Cookbook.new
  @recipes = cookbook.all
  erb :index
end

get '/new' do
  erb :new
end

get '/destroy' do
  erb :destroy
end

post '/recipes' do
  cookbook = Cookbook.new
  recipe = Recipe.new(params[:name1], params[:description1], params[:time1])
  cookbook.add_recipe(recipe)
  redirect to '/'
end

get '/recipes/:index' do
  cookbook = Cookbook.new
  cookbook.remove_recipe(params[:index].to_i)
  redirect to '/'
end

get '/mark/:index' do
  cookbook = Cookbook.new
  cookbook.mark_as_done(params[:index].to_i)
  redirect to '/'
end
