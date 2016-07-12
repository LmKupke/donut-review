class ReviewsController < ApplicationController
  def new
    @dount = Donut.find(params[:donut_id])
    @review = Review.new
  end

  def create
    @donut = Donut.find(params['donut_id'])
    @review = Review.new(review_params)

    @review.donut = @donut
    @review.user = current_user
    if @review.valid?
      @review.save
      ReviewMailer.new_review(@review).deliver_later
    else
      flash[:notice] = @review.errors.full_messages.join(", ").to_s
    end
    redirect_to donut_path(@donut)
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    redirect_to review_path(@review)
  end

  def destroy
    @review.destroy
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
