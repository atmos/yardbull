require 'rake'
require 'fileutils'


APPNAME='YardBulls'

task :default do |t|
  samurai = %x{which samurai}.chomp
  raise ArgumentError, "samurai couldn't be found in your path" if samurai.nil? or samurai.empty?
  %x{git checkout URLHandlerCommand.m}
  %x{perl -p -i -e 's\#SAMURAI_PATH\##{samurai}\#g' URLHandlerCommand.m}
  %x{xcodebuild}
  FileUtils.rm_rf("/Applications/#{APPNAME}.app") if File.exists?("/Applications/#{APPNAME}.app")
  FileUtils.mv "build/Release/#{APPNAME}.app", "/Applications/#{APPNAME}.app"
end