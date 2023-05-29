# Purpose: Model for the API User table
# Authenticated API users can access the API
# Only active in test, staging and production environments
class ApiUser < ApplicationRecord

    before_save :set_expiry_date, if: :new_record?
    before_save :set_api_key, if: :new_record?
    
    # Check to see if the API key is expired
    def expired?
        self.expires_at < Time.now
    end

    private

    def set_expiry_date
        self.expires_at ||= 1.year.from_now
    end

    def set_api_key
        self.api_key ||= SecureRandom.uuid
    end

end
