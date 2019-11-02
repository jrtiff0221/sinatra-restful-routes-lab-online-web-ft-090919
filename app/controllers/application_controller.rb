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


  get '/recipes/:id' do
    @recipe = Recipe.find_by(:id => params[:id])
    erb :recipe
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by(:id => params[:id])
    erb :recipe_edit
  end

  delete '/recipes/:id' do
    @recipe = Recipe.find_by(:id => params[:id])
    @recipe.destroy
    redirect '/recipes'
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by(:id => params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "recipes/#{@recipe.id}"
  end

end
