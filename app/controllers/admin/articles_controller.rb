class Admin::ArticlesController < Admin::AdminController
  before_action :set_admin_article, only: %w[show edit update destroy]

  def index
    @admin_articles = Article.all.page(params[:page])
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def show; end

  def new
    @admin_article = Article.new
  end

  def edit; end

  def create
    @admin_article = Article.new(admin_article_params)
    if @admin_article.save
      flash[:notice] = t('success_create_notice')
      redirect_to admin_articles_path
    else
      render :new
    end
  end

  def update
    if @admin_article.update(admin_article_params)
      flash[:notice] = t('success_create_notice')
      redirect_to admin_articles_path
    else
      render :edit
    end
  end

  def destroy
    @admin_article.destroy
    flash[:notice] = t('success_delete_notice')
    redirect_to admin_articles_path
  end

  private

  def set_admin_article
    @admin_article = Article.find(params[:id])
  end

  def admin_article_params
    params.require(:article).permit(
      :title_uk,
      :title_en,
      :short_description_uk,
      :short_description_en,
      :description_uk,
      :description_en,
      :publication_time,
      :end_publication_time,
      :published,
      tag_ids: [],
      project_images_attributes: %i[id locale image imageable_id imageable_type _destroy]
    )
  end
end
