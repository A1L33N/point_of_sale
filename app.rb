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
  @product = Product.new({:name => params.fetch('product_name'), :price => params.fetch('product_price').to_f, :purchase_id => nil, :purchased =>false})
  if @product.save
    erb(:success)
  else
    erb(:errors)
  end
end
