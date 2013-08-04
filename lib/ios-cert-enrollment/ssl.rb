module IOSCertEnrollment
  module SSL
    @@key, @@certificate, @@ca_certificate = nil
    class << self    
      def key
        return @@key if @@key
        return @@key = OpenSSL::PKey::RSA.new(File.read(IOSCertEnrollment.ssl_key_path), IOSCertEnrollment.ssl_key_password)
      end
    
      def certificate
        return @@certificate if @@certificate
        return @@certificate = OpenSSL::X509::Certificate.new(File.read(IOSCertEnrollment.ssl_certificate_path))
      end
      
      def ca_certificate
        return @@ca_certificate if @@ca_certificate
        return @@ca_certificate = OpenSSL::X509::Certificate.new(File.read(IOSCertEnrollment.ca_certificate_path))
      end
    end
    
  end  
end
