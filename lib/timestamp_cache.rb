
module CacheLastUpdatedTimestamp

  # it will return true on success so it wont break savechain
  def update_timestamp_cache
    Rails.cache.write( self.class.get_timestamp_cache_key, self.updated_at )
  end

  def self.included base
    base.extend ClassMethods
    base.after_save :update_timestamp_cache
    base.attr_accessible :updated_at
  end

  module ClassMethods
    def get_timestamp_cache_key
      "last_#{self.to_s.downcase}_updated_at"
    end

    def refresh_timestamp_cache
      Rails.cache.fetch self.get_timestamp_cache_key  do
        entity = self.find( :first, :order => 'updated_at desc' )
        entity.updated_at
      end
    end
  end

end
