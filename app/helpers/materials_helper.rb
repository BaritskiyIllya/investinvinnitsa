module MaterialsHelper
  def filesize(file)
    number_to_human_size(file.file.size)
  end
end
