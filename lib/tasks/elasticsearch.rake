require 'elasticsearch/rails/tasks/import'

namespace :elasticsearch do
  task fill: :environment do |_task, args|
    args.extras.each do |model_name|
      model_name.singularize.classify.constantize.__elasticsearch__.create_index! force: true
      model_name.singularize.classify.constantize.import force: true
    end
  end
end
