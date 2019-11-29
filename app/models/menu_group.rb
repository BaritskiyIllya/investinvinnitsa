class MenuGroup < ApplicationRecord
  has_many :menus, foreign_key: 'menu_group_id', primary_key: 'group_key', inverse_of: :menu_group
end
