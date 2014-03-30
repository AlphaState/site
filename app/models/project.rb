class Project < ActiveRecord::Base
  include Localizable
  include Addressable

  default_scope {
    where(:locale => [ nil, '', I18n.locale ]).order('priority DESC')
  }

  def find_previous
    Project.where('priority > ?', priority).last
  end

  def find_next
    Project.where('priority < ?', priority).first
  end
end
