class FiguresController < ApplicationController

	get '/figures' do
		@figures = Figure.all
		erb :'/figures/index'
	end

	get '/figures/new' do
		@titles = Title.all
		erb :'/figures/new'
	end

	post '/figures' do
		# {figure: {
	#   name: "String",
    #   title_ids: ["1", "2"]
    #   }}
		Figure.create(params[:figure])
		redirect to('/figures')
	end

	get '/figures/:id' do
		@figure = Figure.find(params[:id])
		erb :'/figures/show'
	end

end