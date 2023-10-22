require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry-byebug'

require_relative 'list_item'
require_relative 'list'
require 'csv'

list = List.new("shopping_list.csv")
list_items = list.all

get "/" do
  @list_items = list.all
  erb :index
end

get "/new" do
  erb :new
end

post "/new" do
  name = params[:name]
  item = ListItem.new(name)
  list.create(item)
  @list_items = list.all
  erb :index
end

get "/toggle=:toggle_index" do
  index = params[:toggle_index].to_i
  list.toggle(index)
  @list_items = list.all
  erb :index
end

get "/item_details=:edit_at_index" do
  @list_items = list.all
  @index = params[:edit_at_index].to_i
  erb :item_details
end

get "/increment=:increment_at_index" do
  @list_items = list.all
  @index = params[:increment_at_index].to_i
  @list_items[@index].increment!
  erb :item_details
end

get "/decrement=:decrement_at_index" do
  @list_items = list.all
  @index = params[:decrement_at_index].to_i
  @list_items[@index].decrement!
  erb :item_details
end

get "/destroy=:destroy_at_index" do
  list.destroy(params[:destroy_at_index].to_i)
  @list_items = list.all
  erb :index
end

get "/clear" do
  list.clear_checked
  @list_items = list.all
  erb :index
end
