require 'grape'

module Stuff
  class API < Grape::API
    format :json

    before do
      secret_header = env['HTTP_X_SECRET_HEADER']
      puts "the secret header is: #{secret_header.inspect}"
    end

    resource :my do
      desc 'Return stuff.'
      get :stuff do
        puts 'route "/my/stuff" called'
        { my: :stuff }
      end
    end
  end
end
