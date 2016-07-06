class ReviewsController < ApplicationController
  def new
    @dount = Donut.find(params[:donut_id])
    @review = Review.new
  end

  def create
    @dount = Donut.find(params[:donut_id])
    @review = Review.new(review_params)
    @review.donut = @donut
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
