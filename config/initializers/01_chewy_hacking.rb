# Looks like chewy may not be compatible with opensearch

module Elasticsearch
  class Client
    def verify_with_version_or_header(body, version, headers)
      @verified = true
    end
  end
end
