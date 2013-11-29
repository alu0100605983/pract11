$:.unshift File.dirname(__FILE__) + 'lib'
$:.unshift '.lib', './spec'

require "bundler/gem_tasks"
require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec)

task :default => :bin

desc "Documentacion"
task :doc do
	sh "firefox doc/index.html"
end

desc "Pruebas Unitarias"
task :test do
	sh "ruby test/tc_Matriz.rb"
end

desc "Pruebas Integracion"
task :spec do
	sh "rspec -I. spec/matrices_spec.rb"
end

desc "Ejecutar binario"
task :bin do
	sh "ruby lib/pract09/matrices.rb"
end
