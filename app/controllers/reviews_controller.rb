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
      redirect_to donut_path(@donut)
    else
      flash[:notice] = @review.errors.full_messages.join(", ").to_s
      redirect_to donut_path(@donut)
    end
  end

  def edit
    @review = Review.find(params[:id])
    @donut = @review.donut
  end

  def update
    @review = Review.find(params[:id])
    @review.user = current_user

    @review.update_attributes(review_params)
    if @review.save
      redirect_to donut_path(@review.donut)
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to donut_path(@review.donut)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
