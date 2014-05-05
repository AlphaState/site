class Post < ActiveRecord::Base
  include Localizable
  include Addressable

  validates :title, :author, :date, :description, :address,
    :content, :locale, presence: true
  validates :address, uniqueness: { scope: :locale }

  default_scope {
    where(:locale => [ nil, '', I18n.locale ]).order('date DESC')
  }

  before_validation :set_date

  def find_previous
    Post.where('date > ?', date).last
  end

  def find_next
    Post.where('date < ?', date).first
  end

  private

  def set_date
    self.date = Time.now.to_date if date.blank?
  end
end
