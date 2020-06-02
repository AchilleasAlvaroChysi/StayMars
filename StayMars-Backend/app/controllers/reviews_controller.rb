class ReviewsController < ApplicationController
  def index
    @reviews = Unit.find(params[:unit_id]).reviews
    render json: @reviews, status: :ok
  end

  def show
    @review = Review.find(params[:id])
    render json: @review, status: :ok
  end

  def create
    @unit = Unit.find(params[:unit_id])
    @user = User.find(params[:user_id])
    @review = Review.new(review_params)

    if @review.save
      @unit.addReview(@review)
      render json: @review , status: :created
    else
      render json: {errors: @review.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private
  def review_params
    params.permit(:score, :body, :user_id, :unit_id)
  end
end
