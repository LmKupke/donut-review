class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    @review = Review.find(params['review_id'])
    @vote = Vote.new(params)
    @vote.review = @review
    @vote.user = current_user
  end

  def edit
    @vote = Vote.find(params[:id])
  end

  def update
    @vote = Vote.find(params[:id])
  end
end
