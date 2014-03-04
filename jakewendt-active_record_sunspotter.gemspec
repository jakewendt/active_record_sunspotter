# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "jakewendt-active_record_sunspotter"
  s.version = "0.0.12"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["George 'Jake' Wendt"]
  s.date = "2014-03-04"
  s.description = "active_record_sunspotter"
  s.email = "github@jakewendt.com"
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "lib/active_record_sunspotter.rb",
    "lib/active_record_sunspotter/rails/engine.rb",
    "lib/active_record_sunspotter/rails/railtie.rb",
    "lib/active_record_sunspotter/search_sunspot_for.rb",
    "lib/active_record_sunspotter/sunspot_column.rb",
    "lib/active_record_sunspotter/sunspot_helper.rb",
    "lib/active_record_sunspotter/sunspot_rails_server.rb",
    "lib/active_record_sunspotter/sunspotability.rb",
    "lib/jakewendt-active_record_sunspotter.rb",
    "vendor/assets/javascripts/sunspot.js",
    "vendor/assets/stylesheets/sunspot.css.scss",
    "vendor/views/layouts/_footer.html.erb",
    "vendor/views/layouts/_sunspot_head.html.erb",
    "vendor/views/layouts/_sunspot_header.html.erb",
    "vendor/views/layouts/sunspot.html.erb",
    "vendor/views/sunspot/_download_csv.html.erb",
    "vendor/views/sunspot/_facets.html.erb",
    "vendor/views/sunspot/_filters.html.erb",
    "vendor/views/sunspot/_link.html.erb",
    "vendor/views/sunspot/_per_page.html.erb",
    "vendor/views/sunspot/_results.html.erb",
    "vendor/views/sunspot/_select_columns.html.erb",
    "vendor/views/sunspot/index.csv.erb",
    "vendor/views/sunspot/index.json.erb"
  ]
  s.homepage = "http://github.com/jakewendt/active_record_sunspotter"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "active_record_sunspotter"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sunspot_rails>, ["= 2.0.0"])
      s.add_runtime_dependency(%q<sunspot_solr>, ["= 2.0.0"])
      s.add_runtime_dependency(%q<progress_bar>, [">= 0"])
    else
      s.add_dependency(%q<sunspot_rails>, ["= 2.0.0"])
      s.add_dependency(%q<sunspot_solr>, ["= 2.0.0"])
      s.add_dependency(%q<progress_bar>, [">= 0"])
    end
  else
    s.add_dependency(%q<sunspot_rails>, ["= 2.0.0"])
    s.add_dependency(%q<sunspot_solr>, ["= 2.0.0"])
    s.add_dependency(%q<progress_bar>, [">= 0"])
  end
end

