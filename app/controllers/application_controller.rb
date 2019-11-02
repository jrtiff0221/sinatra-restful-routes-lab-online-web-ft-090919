class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/recipes'
  end

  get '/recipes' do
    @recipes = Recipes.all
    erb :index
  end

  get '/recipes/new' do
  @recipes = Recipes.new
    erb :new
  end

  post '/recipes' do
    @recipes = Recipes.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"

  end

end
