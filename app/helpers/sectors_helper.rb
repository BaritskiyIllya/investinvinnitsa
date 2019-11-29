module SectorsHelper
  def sector_tab_link(sector)
    url = "#v-pills#{sector.id}"
    html_options = {
      id: url + '-tab',
      'data-toggle': 'pill',
      'aria-controls': 'v-pills-home',
      class: 'nav-link',
      role: 'tab',
      'aria-selected': 'false'
    }

    if sector.position.zero?
      html_options[:class] = 'nav-link active'
      html_options[:'aria-selected'] = 'true'
    end
    link_to(url, html_options) do
      concat sector.title
      concat content_tag(:span, '', class: 'point')
    end
  end

  def sector_tab(sector)
    id = "v-pills#{sector.id}"
    html_options = {
      id: id,
      'aria-labelledby': id + '-tab',
      class: 'tab-pane fade',
      role: 'tabpanel'
    }

    html_options[:class] = 'tab-pane fade show active' if sector.position.zero?
    content_tag(:div, render('sectors/sector', sector: sector), html_options)
  end
end
