class JwtService
    def self.encode(payload)
        JWT.encode(payload, Rails.application.credentials.secret_key_base)
    end

    def self.decode(token)
        decoded = JWT.decode(token, Rails.application.credentials.secret_key_base, true, { algorithm: 'HS256' })
        HashWithIndifferentAccess.new(decoded.first)
    rescue JWT::DecodeError => e
        nil
    end
end