desc "Converts rails models and controllers to sails style"
task sailsify: :environment do
  Rails.application.eager_load!
  generator = Sailsify::MainGenerator.new
  generator.execute
end
