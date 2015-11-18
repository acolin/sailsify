desc "Converts rails models and controllers to sails style"
task sailsify: :environment do
  generator = Sailsify::MainGenerator.new
  generator.execute
end
