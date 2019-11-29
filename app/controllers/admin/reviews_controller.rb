class Admin::ReviewsController < Admin::AdminController
  include DeleteCropperImage

  before_action :set_admin_review, only: %w[show edit update destroy]

  def index
    @admin_reviews = Review.all
  end

  def show; end

  def new
    @admin_review = Review.new
  end

  def edit; end

  def create
    @admin_review = Review.new(admin_review_params)
    if @admin_review.save
      flash[:notice] = t('success_create_notice')
      redirect_to admin_reviews_path
    else
      render :new
    end
  end

  def update
    delete_image?(params[:review][:image], @admin_review)
    if @admin_review.update(admin_review_params)
      flash[:notice] = t('success_create_notice')
      redirect_to admin_reviews_path
    else
      render :edit
    end
  end

  def destroy
    @admin_review.destroy
    flash[:notice] = t('success_delete_notice')
    redirect_to admin_reviews_path
  end

  private

  def set_admin_review
    @admin_review = Review.find(params[:id])
  end

  def admin_review_params
    params.require(:review).permit(Review.globalize_attribute_names + %i[image])
  end
end
