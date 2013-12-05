class ReviewsController < ApplicationController
  #before_action :set_review, only: [:show, :edit, :update, :destroy]

  
  def create
    @user = User.find(params[:user_id])
    @review = @user.reviews.create(review_params)

    redirect_to user_path (@user)


  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:author, :content, :rating, :user_id)
    end
end
