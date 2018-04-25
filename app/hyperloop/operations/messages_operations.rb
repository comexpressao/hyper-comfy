# app/hyperloop/operations/messages_operations.rb
module MessagesOperations
  class MessageBase < Hyperloop::ServerOp
    param :acting_user, nils: true
    dispatch_to { Hyperloop::Application }

    def cachedmessages
      Rails.cache.fetch('messages') { [] }
    end
  end

  class GetMessages < MessageBase
    outbound :messages

    step { params.messages = cachedmessages }
  end

  class Send < MessageBase
    param :message

    step do
      params.message = { message: params.message }
      newcachedmessages = cachedmessages << params.message
      Rails.cache.write('messages', newcachedmessages)
    end
  end
end
