# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')


# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w[admin/admin.js admin/admin.scss application/devise.js
                                                 devise.scss form.scss application/google_map_form.js]
Rails.application.config.assets.precompile += %w[nifty.min.css pace.min.css application/pace.min.js
                                                 application/nifty.min.js nifty-demo-icons.min.css ionicons.min.css
                                                 nifty-demo.min.css]
Rails.application.config.assets.precompile += %w[ckeditor/* application/profile.js profile.scss application/parallax.js]
Rails.application.config.assets.precompile += %w[moderator/moderator.js moderator/moderator.scss]
Rails.application.config.assets.precompile += %w[cabinet/cabinet.js cabinet/cabinet.scss]
Rails.application.config.assets.precompile += %w[application/jquery.jshowoff.js application/jquery.jshowoff.min.js
                                                 jshowoff.css]
Rails.application.config.assets.precompile += %w[table/dataTables.bootstrap.js table/dataTables.responsive.min.js
                                                 table/jquery.dataTables.js table/tables-datatables.js
                                                 table/dataTables.bootstrap.css table/responsive.dataTables.min.css]
Rails.application.config.assets.precompile += %w[slick/slick.css slick/slick-theme.css slick/slick.js
                                                 slick/slick.min.js]
Rails.application.config.assets.precompile += %w[script.js style.css core.min.js invest_map.js]
Rails.application.config.assets.precompile += %w[pie_chart/pie.js pie_chart/style.css pie_chart/d3.v4.min.js]
Rails.application.config.assets.precompile += %w[markup/radio_checkbox.scss markup/map_checkbox.scss]
Rails.application.config.assets.precompile += %w[about.scss area_information.scss invest_map.scss]
Rails.application.config.assets.precompile += %w[color_picker/colorpicker.js color_picker/colorpicker.scss]
Rails.application.config.assets.precompile += %w[*.png *.jpg *.jpeg *.gif]
Rails.application.config.assets.precompile += %w( images/* config/* fonts/* stylesheets/* javascripts/*)
