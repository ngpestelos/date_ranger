task :release do
  puts "Publishing gem date_ranger v#{DateRanger::VERSION}"
  system "gem build date_ranger.gemspec"
  gem_package = "date_ranger-#{DateRanger::VERSION}.gem"
  puts "Pushing #{gem_package} to Rubygems..."
  upload_response = system "gem push #{gem_package}"

  if upload_response
    puts "... success!"
  else
    puts "... problem uploading gem."
  end

  puts "Cleaning up #{gem_package}..."
  system "rm #{gem_package}"
end
