class HospitalController < ApplicationController
    # load_and_authorize_resource
    load_and_authorize_resource only: [:index, :show, :new, :edit]

    def index
        @myhos = Hospital.all
    end
    def show
        @onehos = Hospital.find(params[:id])
    end
    def new
        @hos = Hospital.new
    end
    def create
        # @hos = Hospital.create!(name:params[:hospital][:name], city:params[:hospital][:city], address:params[:hospital][:address])
        @hos = Hospital.create!(hos_params)
       
        if @hos.save
            redirect_to hospital_index_path, :notice => "new hospital added"
        else
            render "new"
        end
    end
    def edit
        @hos = Hospital.find(params[:id])
    end
    def update
        @hos = Hospital.find(params[:id])
        # @uid = params[:user_ids]
        #adding manager id to aray
        # @uid.append(current_user.id)
        @hos.update(hos_params)

        redirect_to hospital_index_path, :notice => "hospital is edited"
    end
    def destroy
        @hos = Hospital.destroy(params[:id])
        redirect_to hospital_index_path, :notice => "hospital is deleted"
    end

    private
    def hos_params
        params.require(:hospital).permit(:name, :city, :address)
    end
end
  