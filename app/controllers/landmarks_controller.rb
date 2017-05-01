class LandmarksController < ApplicationController

	get '/' do
		erb :index
	end

	get '/landmarks' do
		@landmarks = Landmark.all
		erb :'/landmarks/index'
	end

	get '/landmarks/new' do
		erb :'/landmarks/new'
	end

	post '/landmarks' do
		Landmark.create(params)
		redirect to('/landmarks')
	end

	get '/landmarks/:id' do
		@landmark = Landmark.find(params[:id])
		erb :'/landmarks/show'
	end

	get '/landmarks/:id/edit' do
		@landmark = Landmark.find(params[:id])
		erb :'/landmarks/edit'
	end

	patch '/landmarks/:id' do
		@landmark = Landmark.find(params[:id])
		@landmark.update(params[:landmark])
		redirect to("/landmarks/#{@landmark.id}")
	end
end
