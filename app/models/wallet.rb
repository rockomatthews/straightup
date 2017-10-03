class Wallet < ActiveRecord::Base
  belongs_to :user
  after_initialize :set_defaults, unless: :persisted?

  def set_defaults
    self.money  ||= '0'
  end

  composed_of :price,
                :class_name => 'Money',
                :mapping => %w(price cents),
                :converter => Proc.new { |value| Money.new(value) }


end

