RSpec.configure do |config|
  config.before(:each) do |example|
    Chewy.strategy(:bypass)
    stub_elasticsearch_requests
  end

  ES_HOST_WITH_PORT_REGEX = /127.0.0.1:9200/

  def stub_elasticsearch_requests
    stub_request(:any, ES_HOST_WITH_PORT_REGEX).to_return(body: '{}', status: 200)
    allow(Chewy).to receive_message_chain(:client, :search) { {} }
    allow(Chewy).to receive(:strategy).and_wrap_original do |_method, *_args, &block|
      block ? block.call : double.as_null_object
    end
  end
end
