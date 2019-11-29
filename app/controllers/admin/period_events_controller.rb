class Admin::PeriodEventsController < Admin::AdminController
  before_action :set_period_event, only: %w[edit update destroy]

  def index
    @admin_period_events = PeriodEvent.ordered
  end

  def new
    @admin_period_event = PeriodEvent.new
  end

  def edit; end

  def create
    @admin_period_event = PeriodEvent.new(admin_period_event_params)
    if @admin_period_event.save
      flash[:notice] = t('success_create_notice')
      redirect_to admin_period_events_path
    else
      render :new
    end
  end

  def update
    if @admin_period_event.update(admin_period_event_params)
      flash[:notice] = t('success_create_notice')
      redirect_to admin_period_events_path
    else
      render :edit
    end
  end

  def destroy
    @admin_period_event.destroy
    flash[:notice] = t('success_delete_notice')
    redirect_to admin_period_events_path
  end

  private

  def set_period_event
    @admin_period_event = PeriodEvent.find(params[:id])
  end

  def admin_period_event_params
    params.require(:period_event).permit(
      :title_uk,
      :title_en,
      :position,
      events_attributes: %i[
        id
        period_event_id
        _destroy
        title_uk
        title_en
      ]
    )
  end
end
