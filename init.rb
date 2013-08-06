require "#{File.dirname(__FILE__)}/lib/wiki_inline_unc_patch.rb"

Redmine::Plugin.register :redmine_wiki_inline_unc do
  name 'Redmine Wiki Inline UNC plugin'
  author 'Yuya Nishihara'
  description 'This plugin extends Redmine wiki to auto-link UNC paths'
  version '0.0.1'
  url 'https://github.com/yuja/redmine_wiki_inline_unc'
  author_url 'https://github.com/yuja'
end

Rails.configuration.to_prepare do
  cls = Redmine::WikiFormatting::Textile::Formatter
  cls.send(:include, WikiInlineUncPatch) unless cls.include? WikiInlineUncPatch
end
