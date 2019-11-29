class HomeController < ApplicationController
  # def index
  #   @sliders = Slider.joins(:project_images).where('project_images.locale' => I18n.default_locale)
  #   @main_video = Video.position('main')
  #   @articles = Article.published_now.first(3)
  #   @advantages = Advantage.order(id: :asc)
  #   @map_content = Content.find_by(alias: 'map')
  #   @teams_without_department = Team.on_main.order(:trim).take(3)
  #   @reviews = Review.all
  # end

  def index
    @reviews = Review.all
    @main_video = Video.position('main')
    @contents = Contents::IndexPresenter.new
  end

  def guide; end

  def tourism
    @landmarks = Landmark.for_tourism.page(params[:page]).per(4)
    @content = Content.for_tourism
    @period_events = PeriodEvent.for_tourism
    @trips = Trip.for_tourism
  end
end
