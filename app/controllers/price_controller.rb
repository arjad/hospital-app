class PriceController < ApplicationController
    def index
        # @u = Hospital.find(params[:hospital_id]).treatments
        @doc = Hospital.find(params[:hospital_id]).hospitaltreatments.where(treatment_id:params[:treatment_id])
    end
    def show
    end
    def new
        @u = Hospitaltreatment.find_by(hospital_id:params[:hospital_id], treatment_id:params[:treatment_id])
        
    end
    def create
        @u = Hospitaltreatment.find_by(hospital_id:params[:hospital_id], treatment_id:params[:id])
        @u.update(price:params[:hospitaltreatment][:price])

        redirect_to hospital_treatment_path, :notice => "price updated"

    end
    def edit

    end
    def update
    end
    def destroy
    end

    private
end
  