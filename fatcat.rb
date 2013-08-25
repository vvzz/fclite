require 'rubygems'
require 'sinatra'
require 'sass'

set :public_folder, 'public'
class SassEngine < Sinatra::Base
  set :views,   File.dirname(__FILE__)    + '/assets/sass'

  get '/css/*.css' do
    filename = params[:splat].first
    sass filename.to_sym
  end
end
# class CoffeeHandler < Sinatra::Base
    # set :views, File.dirname(__FILE__) + '/assets/coffee'
    # get "/js/*.js" do
        # filename = params[:splat].first
        # coffee filename.to_sym
    # end
# end
use SassEngine
get '/' do
  redirect 'index.html'
end

