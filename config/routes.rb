HoustonLightning::Application.routes.draw do
  class FormatTest
    attr_accessor :mime_type

    def initialize(format)
      @mime_type = Mime::Type.lookup_by_extension(format)
    end

    def matches?(request)
      request.format == mime_type || request.format == '*/*'
    end
  end

  resources :talks, only: [:index, :create], :constraints => FormatTest.new(:json)
  post '/admin/authenticate', to: 'admin#authenticate', :constraints => FormatTest.new(:json)
  delete '/admin/destroy', to: 'admin#destroy', :constraints => FormatTest.new(:json)
  post '/admin/start', to: 'admin#start', :constraints => FormatTest.new(:json)

  get '*foo', :to => 'angular#index', :constraints => FormatTest.new(:html)
  get '/', :to => 'angular#index', :constraints => FormatTest.new(:html)
end
