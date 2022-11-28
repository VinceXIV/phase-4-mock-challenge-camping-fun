class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    def index
        render json: Camper.all, status: :ok
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperActivitySerializer, status: :ok
    end

    def create
        render json: Camper.create!(camper_params), status: :created
    end

    private
    def record_not_found
        render json: {error: "Camper not found"}, status: 404
    end

    def record_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def camper_params
        params.permit(:name, :age)
    end
end
