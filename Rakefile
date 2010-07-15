require 'rake'
require 'fileutils'

APPNAME='YardBulls'

task :default do |t|
  ey_gem_path = %x{which ey}.chomp
  raise ArgumentError, "the ey gem couldn't be found in your path" if ey_gem_path.nil? or ey_gem_path.empty?
  %x{git checkout URLHandlerCommand.m}
  %x{perl -p -i -e 's\#ENGINEYARD_GEM_PATH\##{ey_gem_path}\#g' URLHandlerCommand.m}
  %x{xcodebuild}
  FileUtils.rm_rf("/Applications/#{APPNAME}.app") if File.exists?("/Applications/#{APPNAME}.app")
  FileUtils.mv "build/Release/#{APPNAME}.app", "/Applications/#{APPNAME}.app"
  %x{open /Applications/#{APPNAME}.app}
  %x{git checkout URLHandlerCommand.m}
end
