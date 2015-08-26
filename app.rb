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
    redirect('/products/'.concat(@product.id).to_s)
  else
    erb(:errors)
  end
end

get('/products/:id') do
  id = params.fetch('id').to_i
  @product = Product.find(id)
  erb(:product_info)
end

patch('/products/:id') do
  id = params.fetch('id').to_i
  @product = Product.find(id)

  new_name = params.fetch('name')
  new_price = params.fetch('price').to_f
  @product.update_attributes(:name => new_name, :price => new_price)

  erb(:success)
end
