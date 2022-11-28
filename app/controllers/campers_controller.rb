class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    def index
        render json: Camper.all
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperActivitySerializer
    end

    def create
        render json: Camper.create!(camper_params)
    end

    private
    def record_not_found
        render json: {error: "Camper not found"}
    end

    def record_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}
    end

    def camper_params
        params.permit(:name, :age)
    end
end
