require "#{File.dirname(__FILE__)}/lib/wiki_inline_unc_patch.rb"

Redmine::Plugin.register :redmine_wiki_inline_unc do
  name 'Redmine Wiki Inline Unc plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end

Rails.configuration.to_prepare do
  cls = Redmine::WikiFormatting::Textile::Formatter
  cls.send(:include, WikiInlineUncPatch) unless cls.include? WikiInlineUncPatch
end
