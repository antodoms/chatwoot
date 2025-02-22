module WootMessageSeeder
  def self.create_sample_email_collect_message(conversation)
    Message.create!(
      account: conversation.account,
      inbox: conversation.inbox,
      conversation: conversation,
      message_type: :template,
      content_type: :input_email,
      content: 'Get notified by email'
    )
  end

  def self.create_sample_cards_message(conversation)
    Message.create!(
      account: conversation.account,
      inbox: conversation.inbox,
      conversation: conversation,
      message_type: :template,
      content_type: 'cards',
      content_attributes: {
        items: [
          sample_card_item
        ]
      }
    )
  end

  def self.sample_card_item
    {
      "media_url": 'https://i.imgur.com/d8Djr4k.jpg',
      "title": 'Acme Shoes 2.0',
      "description": 'Move with Acme Shoe 2.0',
      "actions": [
        {
          "type": 'link',
          "text": 'View More',
          "uri": 'http://acme-shoes.inc'
        },
        {
          "type": 'postback',
          "text": 'Add to cart',
          "payload": 'ITEM_SELECTED'
        }
      ]
    }
  end

  def self.create_sample_input_select_message(conversation)
    Message.create!(
      account: conversation.account,
      inbox: conversation.inbox,
      conversation: conversation,
      message_type: :template,
      content: 'Your favorite food',
      content_type: 'input_select',
      content_attributes: {
        "items": [
          { "title": '🌯 Burito', "value": 'Burito' },
          { "title": '🍝 Pasta', "value": 'Pasta' },
          { "title": ' 🍱 Sushi', "value": 'Sushi' },
          { "title": ' 🥗 Salad', "value": 'Salad' }
        ]
      }
    )
  end

  def self.create_sample_form_message(conversation)
    Message.create!(
      account: conversation.account,
      inbox: conversation.inbox,
      conversation: conversation,
      message_type: :template,
      content_type: 'form',
      content_attributes: {
        "items": [
          { "name": 'email', "placeholder": 'Please enter your email', "type": 'email', "label": 'Email' },
          { "name": 'text_aread', "placeholder": 'Please enter text', "type": 'text_area', "label": 'Large Text' },
          { "name": 'text', "placeholder": 'Please enter text', "type": 'text', "label": 'text', "default": 'defaut value' }
        ]
      }
    )
  end

  def self.create_sample_articles_message(conversation)
    Message.create!(
      account: conversation.account,
      inbox: conversation.inbox,
      conversation: conversation,
      message_type: :template,
      content: 'Tech Companies',
      content_type: 'article',
      content_attributes: {
        "items": [
          { "title": 'Acme Hardware', "description": 'Hardware reimagined', "link": 'http://acme-hardware.inc' },
          { "title": 'Acme Search', "description": 'The best Search Engine', "link": 'http://acme-search.inc' }
        ]
      }
    )
  end
end
