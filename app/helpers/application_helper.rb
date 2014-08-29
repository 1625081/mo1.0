module ApplicationHelper
  def self.no_html
    self.gsub(/<\/?.*?>/,"")
  end
end
