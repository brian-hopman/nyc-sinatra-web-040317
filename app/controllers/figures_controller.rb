class FiguresController < ApplicationController

	get '/figures' do
		@figures = Figure.all
		erb :'/figures/index'
	end

	get '/figures/new' do
		@titles = Title.all
		@landmarks = Landmark.all
		erb :'/figures/new'
	end

	post '/figures' do
		# {figure: {
	#   name: "String",
    #   title_ids: ["1", "2"]
    #   }}
		@figure = Figure.create(params[:figure])
		@figure.titles << Title.find_or_create_by(params[:title]) if !params[:title].values.any? &:empty?
		@figure.landmarks << Landmark.find_or_create_by(params[:landmark]) if !params[:landmark].values.any? &:empty?
		redirect to('/figures')
	end

	get '/figures/:id' do
		@figure = Figure.find(params[:id])
		erb :'/figures/show'
	end

	get '/figures/:id/edit' do
		@titles = Title.all
		@landmarks = Landmark.all
		@figure = Figure.find(params[:id])
		erb :'/figures/edit'
	end

	patch '/figures/:id' do
		@figure = Figure.find(params[:id])
		if !params[:figure][:title_ids]
			@figure.title_ids = []
		end
		if !params[:figure][:landmark_ids]
			@figure.landmark_ids = []
		end
		@figure.update(params[:figure])
		@figure.titles << Title.find_or_create_by(params[:title]) if !params[:title].values.any? &:empty?
		@figure.landmarks << Landmark.find_or_create_by(params[:landmark]) if !params[:landmark].values.any? &:empty?
		redirect to("/figures/#{@figure.id}")
	end


end
