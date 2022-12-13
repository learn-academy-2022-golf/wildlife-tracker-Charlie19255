class AnimalSightingsController < ApplicationController
    def index
        # sight = AnimalSighting.all
        # render json: sight
        sightings = AnimalSighting.where(date: params[:start_date]..params[:end_date])
    render json: sightings
    end
    def show
        sight = AnimalSighting.find(params[:id])
        render json: sight
    end
    def create
        sight = AnimalSighting.create(sight_params)
        if sight.valid?
            render json: sight
        else
            render json: sight.errors
        end
    end
    def destroy
        sight = AnimalSighting.find(params[:id])
        if sight.destroy
            render json: sight
        else
            render json: sight.errors
        end

    end
    def update
        sight = AnimalSighting.find(params[:id])
        sight.update(sight_params)
        if sight.valid?
          render json: sight
        else
          render json: sight.errors
        end
      end

    private
    def sight_params
        params.require(:animal_sighting).permit(:latitude, :longitude, :date, :animal_id)
    end
    def sightings_params
        params.require(:animal_sightings).permit(:start_date, :end_date)
    end
end
