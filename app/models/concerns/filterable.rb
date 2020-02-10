# frozen_string_literal: true

module Filterable
  extend ActiveSupport::Concern

  included do
    @filters ||= []
  end

  module ClassMethods
    def filter(name, *args)
      scope(name, *args)
      @filters << name
    end

    def apply_filter(params)
      records = all

      params.each do |key, value|
        if @filters.include?(key.to_sym) && value.present?
          records = records.public_send(key, value)
        end
      end

      records
    end
  end
end
