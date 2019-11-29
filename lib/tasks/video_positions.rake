namespace :video_positions do
  task main: :environment do
    VideoPosition.destroy_all
    VideoPosition.create({ id: 1, title: 'На головній' })
    puts 'Upload finished successfully'
  end
end
