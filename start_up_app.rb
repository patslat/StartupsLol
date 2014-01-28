require 'sinatra'
require 'haml'
require 'json'
require 'rubygems'
require 'active_support/inflector'

set :haml, format: :html5
set :static, true
use Rack::Static, :urls => ['/stylesheets', '/javascripts'], :root => 'public'

EXISTING_COMPANIES = %w(
  Facebook Twitter Foursquare LinkedIn Uber Amazon Pandora Pintrest 4chan
  Reddit OkCupid Google Yelp Craigslist PagerDuty
)
NOUNS = File.open('nouns.txt').readlines.map(&:chomp).map(&:pluralize)

get '/' do
  haml :index, locals: {
    existing_company: random_company,
    nouns: random_noun
  }
end

get '/idea' do
  content_type :json
  {idea: "It's like #{random_company} for #{random_noun}"}.to_json
end

def random_company
  EXISTING_COMPANIES.sample
end

def random_noun
  NOUNS.sample
end
