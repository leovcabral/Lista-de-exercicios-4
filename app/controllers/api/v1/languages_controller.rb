class Api::V1::LanguagesController < ApplicationController
    def index
        languages = Language.all
        render json: languages, status: 200 #ok
    end

    def create
        language = Language.new(teacher_params)
        language.save!
        render json: language, status: 201 #created
    rescue StandardError
        head(:unprocessable_entity)
    end

    def delete
        language = Language.find(params[:id])
        language.destroy!
        render json: language, status: 200
    rescue StandardError
        head(:bad_request)
    end
    
    private 
    def teacher_params
        params.require(:language).permit(:name, :teacher_id)
    
    end
 
end
