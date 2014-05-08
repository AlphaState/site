module Addressable
  extend ActiveSupport::Concern

  included do
    extend ClassMethods
  end

  def to_param
    address.blank? ? id : address
  end

  module ClassMethods
    def find_by_param! param
      if param =~ /^(\d+)/
        find_by! id: $1.to_i
      else
        find_by! address: param
      end
    end
  end
end
