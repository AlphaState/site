class Post < ActiveRecord::Base
  include Localizable
  include Addressable

  validates :title, :author, :date, :description, :address,
    :content, :locale, presence: true
  validates :address, uniqueness: { scope: :locale }

  default_scope {
    where(:locale => [nil, '', I18n.locale]).order('date DESC')
  }

  before_validation :set_date

  private

  def set_date
    self.date = Time.now.to_date if date.blank?
  end
end
