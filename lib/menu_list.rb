class MenuList
  attr_reader :title, :tag_alt, :link

  def initialize(args)
    @tag_alt = args[:tag_alt]
    @title = args[:title]
    @link = args[:link]
  end

  class << self
    def build_top_bar
      res = {}
      Menu.top_bar.parent_menu.active.order(position: :asc).each do |main_menu|
        res[main_menu.id] = {}
        res[main_menu.id][:tag_alt] = main_menu.tag_alt
        res[main_menu.id][:title] = main_menu.title
        res[main_menu.id][:link] = main_menu.link
        res[main_menu.id][:children] = main_menu.children.blank? ? nil : retrieve_sub_menu_data(main_menu)
      end
      res
    end

    private

    def retrieve_sub_menu_data(menu)
      res = []
      menu.children.active.order(position: :asc).each do |sub_menu|
        res << new(tag_alt: sub_menu.tag_alt, title: sub_menu.title, link: sub_menu.link)
      end
      res
    end
  end
end
