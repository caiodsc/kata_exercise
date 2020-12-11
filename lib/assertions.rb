# frozen_string_literal: true

module Assertions
  def assert(&block)
    raise ArgumentError unless block.call
  end
end
