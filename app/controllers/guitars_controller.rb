class GuitarsController < ApplicationController

    def new
        @guitar = Guitar.new
        @guitar.build_make
    end 

    def create
        @guitar = Guitar.new(guitar_params)
        @guitar.user_id = session[:user_id]
        if @guitar.save
            redirect_to guitar_path(@guitar)
        else
            @guitar.build_make
            render :new
        end
    end 

    def index
        @guitars = Guitar.all
    end

    def show
        @guitar = Guitar.find_by(params[:id])
     redirect_to guitars_path if !@guitar
    end 

    private

    def guitar_params
        params.require(:guitar).permit(:model, :description, :make_id, make_attributes: [:name])
    end 

end 
