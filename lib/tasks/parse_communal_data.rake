namespace :parse_communal_data do
  task :invoke, %i[file_name] => :environment do |task, args|
    require 'progress_bar'
    require 'simple-spreadsheet'
    require 'csv'

    file_name = args.file_name
    dir = 'lib/files/'
    error = false
    path = Rails.root.join(dir, file_name)

    if File.exist?(path)
      puts "Loading file #{file_name}"
      xls = SimpleSpreadsheet::Workbook.read(path)
      xls.selected_sheet = xls.sheets.first
      progress_bar = ProgressBar.new(xls.last_row - 1)

      (xls.first_row + 1).upto(xls.last_row) do |line|
        if xls.cell(line, 17).present?
          @land_category = LandCategory.find_or_initialize_by(name: xls.cell(line, 17).strip)
          @land_category.save if @land_category.new_record?
        end

        if xls.cell(line, 18).present?
          @communal_object_type = CommunalObjectType.find_or_initialize_by(name: xls.cell(line, 18).strip)
          @communal_object_type.save if @communal_object_type.new_record?
        end

        if xls.cell(line, 19).present?
          @communal_object_name = CommunalObjectName.find_or_initialize_by(name: xls.cell(line, 19).strip)
          @communal_object_name.save if @communal_object_name.new_record?
        end

        if xls.cell(line, 21).present?
          @balance_holder = BalanceHolder.find_or_initialize_by(name: xls.cell(line, 21).strip)
          @balance_holder.save if @balance_holder.new_record?
        end

        if xls.cell(line, 22).present?
          @communal_branch = CommunalBranch.find_or_initialize_by(name: xls.cell(line, 22).strip)
          @communal_branch.save if @communal_branch.new_record?
        end

        if xls.cell(line, 23).present?
          @balancer = Balancer.find_or_initialize_by(name: xls.cell(line, 23).strip)
          @balancer.save if @balancer.new_record?
        end

        param = {
          field_category_uk: strip_string( xls.cell(line, 1) ), #категорія земель
          house_number: strip_string(xls.cell(line, 2)), #номер будинку
          room_uk: strip_string(xls.cell(line, 3)),  #приміщення
          object_name_uk: strip_string(xls.cell(line, 6)), #назва
          prop_registration: xls.cell(line, 7), #Державна реєстрація майна
          cadastral_number: strip_string(xls.cell(line, 8)), #Кадастровий номер
          area: xls.cell(line, 9), #площа
          rate_percent: xls.cell(line, 10), #Ставка річної орендної плати/ земельного податку, %
          year_tax: xls.cell(line, 11), #Сума річної орендної плати земельного податку, грн
          operation_year: change_float_type(xls.cell(line, 12)), #Рік експлуатації
          level: change_float_type(xls.cell(line, 13)), #Поверх
          tech_area: xls.cell(line, 14), #Площа(технічні характеристики)
          build_year: change_float_type(xls.cell(line, 15)), #Рік забудови
          architectural: xls.cell(line, 16).to_i.eql?(1), #Архітектурна ціність (true/false)
          land_category_id: @land_category.try(:id), #Вид речового права
          communal_object_type_id: @communal_object_type.try(:id), #Тип об'єкту
          communal_object_name_id: @communal_object_name.try(:id), #Назва
          address_uk: strip_string(xls.cell(line, 20)), #Адреса у місті
          balance_holder_id: @balance_holder.try(:id), #Балансоутримувач
          communal_branch_id: @communal_branch.try(:id), #Галузь
          map_layer_id: 11,    #Об'єкти комунальної власності
          balancer_ids: [@balancer.try(:id)]
        }

        if xls.cell(line, 5).present? && xls.cell(line, 4).present?
          param[:geo_json_attributes] = {
              geo_type: 'Point',
              position: "{\"type\":\"Point\",\"coordinates\":[#{xls.cell(line, 5)},#{xls.cell(line, 4)}]}"
          }
          param[:gis_type_name] = 'Point'
        end

        object = CommunalArea.new(param)

        unless object.save
          CSV.open(dir + 'errors.csv', "wb", :col_sep => ';') do |csv|
            csv << ["Not added line #{line}", object.errors.messages]
          end
          error = "Check file #{dir}errors.csv"
        end

        progress_bar.increment
      end
      puts 'Task completed successful'
    else
      puts "File #{file_name} excepted in the directory"
    end

    puts error if error.present?
  end

  def strip_string(string)
    string.present? ? string.strip : nil
  end

  def change_float_type(year)
    if year.to_i.zero?
      return ''
    else
      year.to_i.to_s
    end
  end
end