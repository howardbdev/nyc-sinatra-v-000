class LandmarksController < ApplicationController

  get '/' do
    redirect "/landmarks"
  end

  get "/landmarks" do
    @landmarks = Landmark.all
    erb :"/landmarks/index"
  end

  post "/landmarks" do
    @landmark = Landmark.new(params[:landmark])
    @landmark.save
    erb :'landmarks/show'
  end

  get "/landmarks/new" do
    erb :"/landmarks/new"
  end

  get "/landmarks/:id" do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end

  get "/landmarks/:id/edit" do
    @landmark = Landmark.find_by_id(params[:id])
    erb :"/landmarks/edit"
  end

  patch "/landmarks/:id" do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])
    @landmark.save

    redirect "/landmarks/#{params[:id]}"
  end


end
