module TourismHelper
  def tourism_block_title(data)
    data.detect { |e| e.first == 'tourism_historical' }.second
  end

  def tourism_block_desc(data)
    data.detect { |e| e.first == 'tourism_historical' }.last
  end

  def tourism_fact_title(data)
    data.detect { |e| e.first == 'tourism_facts' }.second
  end

  def tourism_fact_desc(data)
    text = data.detect { |e| e.first == 'tourism_facts' }.last
    return '' if text.blank?

    html_doc = Nokogiri::HTML(text)
    arr_text = html_doc.search('//text()').map(&:text).delete_if { |x| x !~ /[\w«»\()"]/ }
    col_1 = (arr_text.size / 2.0).ceil
    col_2 = arr_text.size - col_1

    block1 = content_tag :div, class: 'col-12 col-md-6' do
      content_tag :div, class: 'block1' do
        arr_text.take(col_1).each do |item|
          concat content_tag(:div, item)
        end
      end
    end

    block2 = content_tag :div, class: 'col-12 col-md-6' do
      content_tag :div, class: 'block2' do
        arr_text.drop(col_1).each do |item|
          concat content_tag(:div, item)
        end
      end
    end
    content_tag :div, block1 + block2, class: 'row'
  end

  def tourism_useful_title(data)
    data.detect { |e| e.first == 'tourism_useful' }.second
  end

  def tourism_useful_desc(data)
    text = data.detect { |e| e.first == 'tourism_useful' }.last
    text
  end
end
