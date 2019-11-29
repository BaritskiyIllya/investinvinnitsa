class Admin::TripsController < Admin::AdminController
  before_action :set_trip, only: %w[edit update destroy]

  def index
    @admin_trips = Trip.order(position: :asc)
  end

  def new
    @admin_trip = Trip.new
  end

  def edit; end

  def create
    @admin_trip = Trip.new(admin_trip_params)
    if @admin_trip.save
      flash[:notice] = t('success_create_notice')
      redirect_to admin_trips_path
    else
      render :new
    end
  end

  def update
    if @admin_trip.update(admin_trip_params)
      flash[:notice] = t('success_create_notice')
      redirect_to admin_trips_path
    else
      render :edit
    end
  end

  def destroy
    @admin_trip.destroy
    flash[:notice] = t('success_delete_notice')
    redirect_to admin_trips_path
  end

  private

  def set_trip
    @admin_trip = Trip.find(params[:id])
  end

  def admin_trip_params
    params.require(:trip).permit(
      :title_uk,
      :title_en,
      :link_uk,
      :link_en,
      :img,
      :position
    )
  end
end
