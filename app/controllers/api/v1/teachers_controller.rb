class Api::V1::TeachersController < ApplicationController
    def index
        professores = Teacher.all
        render json: professores, status: 200 #ok
    end

    def show
        professor = Teacher.find(params[:id])
        render json: professor, status: 200 #ok
    rescue StandardError
        head(:not_found)
    end

    def create
        professor = Teacher.new(teacher_params)
        professor.save!
        render json: professor, status: 201 #created
    rescue StandardError
        head(:unprocessable_entity)
    end

    
    def update
        professor = Teacher.find(params[:id])
        professor.update!(teacher_params)
        render json: professor, status: 200 #ok
    rescue StandardError
        head(:unprocessable_entity)
    end

    def delete
        professor = Teacher.find(params[:id])
        professor.destroy!
        render json: professor, status: 200
    rescue StandardError
        head(:bad_request)
    end

    #def my_students
      #  professor = Teacher.find(params[:id])
       # students = Student.
        #render json: professor, status: 200
    #rescue StandardError
       # head(:bad_request)
    #end

    private 
    def teacher_params
        params.require(:teacher).permit(
            :name,
            :email,
            :birthdate
        )
    end
end
