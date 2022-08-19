class TreatmentController < ApplicationController
    # load_and_authorize_resource
    load_and_authorize_resource only: [:index, :show, :new, :edit]

    def index
        @mytreat = Hospital.find(params[:hospital_id]).treatments.all
    end
    def show
        @onetreat = Treatment.find(params[:id])
    end
    def new
        @treat = Hospital.find(params[:hospital_id]).treatments.new
    end

    def assignuser
        @ht= Hospitaltreatment.find_by(hospital_id:params[:hospital_id], treatment_id: params[:id]).id

        if User.find(params[:uid]).hospitaltreatment_id == nil
           a= true;
            User.all.each do |u|
                if u.hospitaltreatment_id == @ht
                    a= false
                end 
            end
            if a
                User.find(params[:uid]).update(hospitaltreatment_id:@ht)
                redirect_to hospital_treatment_path, :notice => "user is assigned"
            else
                redirect_to hospital_treatment_path, :notice => "not more than one user"
            end

        elsif User.find(params[:uid]).hospitaltreatment_id != nil
            User.find(params[:uid]).update(hospitaltreatment_id:nil)
            redirect_to hospital_treatment_path, :notice => "user is removed"
        end
    end
    def assignprice
        @ht= Hospitaltreatment.find_by(hospital_id:params[:hospital_id], treatment_id: params[:id])
        @ht.update(price:params[:p])
        redirect_to hospital_treatment_path, :notice => "price assigned"
    end

    def create
        @treat = Hospital.find(params[:hospital_id]).treatments.create(treat_params)

        if @treat.save
            redirect_to hospital_treatment_index_path, :notice => "new Treatment added"
        else
            render "new"
        end
    end
    def edit
        @treat = Hospital.find(params[:hospital_id]).treatments.find(params[:id])
    end
    def update
        @treat = Hospital.find(params[:hospital_id]).treatments.find(params[:id])

        #adding manager id to aray
        # @uid.append(current_user.id)
        @treat.update(treat_params)

        redirect_to hospital_treatment_index_path, :notice => "Treatment is edited"
    end
    def destroy
        @treat = Treatment.destroy(params[:id])
        redirect_to hospital_treatment_index_path, :notice => "Treatment is deleted"
    end

    private
    def treat_params
        params.require(:treatment).permit(:name)
    end
end
  