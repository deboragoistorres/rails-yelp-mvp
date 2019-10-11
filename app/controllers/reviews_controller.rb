class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    if @review.valid?
      @review.restaurant = @restaurant
      @review.save
    end
    redirect_to restaurant_path(@restaurant)
    # redirect_to restaurants_path
  end

  def show
    @review = Review.find(params[:id])
    redirect_to restaurants_path
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to restaurants_path
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurants_path
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
