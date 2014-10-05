namespace :test do
  task :run => ['test:units', 'test:functionals', 'test:integration', 'test:lib']

  Rails::TestTask.new(lib: "test:prepare") do |t|
    t.pattern = 'test/lib/**/*_test.rb'
  end
end
