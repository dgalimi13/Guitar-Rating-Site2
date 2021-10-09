class ReviewsController < ApplicationController

    def new
        if @guitar = Guitar.find_by_id(params[:id])
        @review = @guitar.reviews.build 
        else
            @review = Review.new
    end 

    def index
    end 

end
