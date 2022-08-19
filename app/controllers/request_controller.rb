class RequestController < ApplicationController
    load_and_authorize_resource only: [:index, :new, :show, :edit]

    def index
        @docreq = Request.where(requestto:current_user.id)
        @patreq = Request.where(user_id:current_user.id)
    end
    def show
        @req = Request.find(params[:id])
    end
    def new
        @req = current_user.requests.new
    end
    def create
        @req = current_user.requests.create(req_params_create)
        @req.update(status:1)

        if @req.save
            redirect_to request_index_path, :notice => "new req added"
        else
            render "new"
        end
    end
    def edit
        @req = Request.find(params[:id])
    end
    def update
        if params[:request][:status] == "accept"
            @s = 3
        elsif params[:request][:status] == "reject"
            @s=2
        else params[:request][:status] == "pending"
            @s= 1

        end
        @req = Request.find(params[:id]).update!(status:@s)

        redirect_to request_index_path, :notice => "req status added"
    end
    def destroy
        @req = Request.destroy(params[:id])
        redirect_to request_index_path, :notice => "req is deleted"
    end

    private
    def req_params
        params.require(:request).permit(:user_id, :requestto, :status)
    end
    def req_params_create
        params.permit(:user_id, :requestto, :status)
    end
end
  