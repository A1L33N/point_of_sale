require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
require('./lib/customer')
require('./lib/product')
require('./lib/purchase')
also_reload('lib/**/*.rb')
require('pg')
require('pry')

get('/') do
  erb(:index)
end

get('/products') do
  erb(:products)
end

post('/products') do
  @product = Product.create({:name => params.fetch('new_product'), :price => params.fetch('price').to_f, :purchase_id => nil, :purchased =>false})
  erb(:success)

end
