require 'httparty'
require 'stringex'

desc "scrape a URL"
task :fetch_article, :url do |t, args|

end



desc %Q{Begin a new post in #{source_dir}/#{posts_dir}
usage: rake new_data["Some title"] }
task :new_data, :title do |t, args|
  title = args.title

  # mkdir_p "#{source_dir}/#{posts_dir}"
  slug = title.to_url
  filename = File.join(data_dir, sub_dir, slug) + ".yaml"
  if File.exist?(filename)
    abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
  end
  puts "Creating new data: #{filename}"
  open(filename, 'w') do |f|
    f.puts "---"
    f.puts "title: \"#{title.gsub(/&/,'&amp;')}\""
    f.puts "created_at: #{Time.now.strftime('%Y-%m-%d %H:%M:%S %z')}"
    f.puts "---"
  end
end
