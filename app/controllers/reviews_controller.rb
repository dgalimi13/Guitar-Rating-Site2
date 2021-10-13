class ReviewsController < ApplicationController

    def new
        if @guitar = Guitar.find_by_id(params[:guitar_id])
        @review = @guitar.reviews.build 
        else
            @review = Review.new
        end 
    end 

    def index
    end 

    private 

    def review_params
        params.require(:review).permit(:guitar_id, :content, :stars, :title)
    end 

end
