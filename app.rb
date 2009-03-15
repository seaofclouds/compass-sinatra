require 'rubygems'
require 'compass'
require 'sinatra'

configure do
  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = "sass"
  end
end

get '/stylesheets/screen.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :screen, :sass => Compass.sass_engine_options
end

get '/' do
  haml :index
end