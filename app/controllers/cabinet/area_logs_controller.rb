class Cabinet::AreaLogsController < Cabinet::CabinetController
  def index
    @area_logs = AreaLog.all
  end
end
