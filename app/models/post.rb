class Post < ActiveRecord::Base
  before_create :set_locale

  default_scope {
    where(:locale => [ nil, '', I18n.locale ]).order('date DESC')
  }

  def to_param
    address.blank? ? id : address
  end

  def self.find_by_param! param
    if param =~ /^(\d+)/
      find_by! id: $1.to_i
    else
      find_by! address: param
    end
  end

  private

  def set_locale
    self.locale = I18n.locale
  end
end
