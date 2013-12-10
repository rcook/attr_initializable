require 'active_record'

module TestUtils
  extend self

  ACTIVE_RECORD_3_MINIMUM_VERSION = Gem::Version.new('3.2.0')
  ACTIVE_RECORD_4_MINIMUM_VERSION = Gem::Version.new('4.0.0')
  ACTIVE_RECORD_5_MINIMUM_VERSION = Gem::Version.new('5.0.0')

  def active_record_version
    @active_record_version ||= Gem.loaded_specs['activerecord'].version
  end

  def is_active_record_3?
    ACTIVE_RECORD_3_MINIMUM_VERSION <= active_record_version && active_record_version < ACTIVE_RECORD_4_MINIMUM_VERSION
  end

  def is_active_record_4?
    ACTIVE_RECORD_4_MINIMUM_VERSION <= active_record_version && active_record_version < ACTIVE_RECORD_5_MINIMUM_VERSION
  end
end

