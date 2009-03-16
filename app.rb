require 'rubygems'
require 'compass' #must be loaded before sinatra
require 'sinatra'
require 'haml'    #must be loaded after sinatra

# set sinatra's variables
set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :views, "views"

#
get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass(:"stylesheets/#{params[:name]}", :sass => { :load_paths => ( [ File.join(Sinatra::Application.views, 'stylesheets') ] + Compass::Frameworks::ALL.map { |f| f.stylesheets_directory } ) } )
end

get '/' do
  haml :index
end