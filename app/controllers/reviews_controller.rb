class ReviewsController < ApplicationController

    def new
        if @guitar = Guitar.find_by_id(params[:guitar_id])
        @review = @guitar.reviews.build 
        else
            @review = Review.new
        end 
    end 

    def create
        @review = Review.new(review_params)
        if @review.save
        redirect_to review_path(@review)
        else 
            render :new
        end 
    end 

    def show 

    end

    def index
    end 

    private 

    def review_params
        params.require(:review).permit(:guitar_id, :content, :stars, :title)
    end 

end
