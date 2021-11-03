// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
global.Rails = Rails;
Turbolinks.start()
ActiveStorage.start()

require("bootstrap")
import "../../assets/stylesheets/application";
document.addEventListener("turbolinks:load", function() {
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
        $('[data-toggle="popover"]').popover()
    })
})

import "bootstrap"

$(function() {
    $('#new_room_message').on('ajax:success', function(a, b,c ) {
        $(this).find('input[type="text"]').val('');
    });
});

$(function() {
    $('[data-channel-subscribe="room"]').each(function(index, element) {
      var $element = $(element),
          room_id = $element.data('room-id')
          messageTemplate = $('[data-role="message-template"]');
  
      $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000)        
  
      App.cable.subscriptions.create(
        {
          channel: "RoomChannel",
          room: room_id
        },
        {
          received: function(data) {
            var content = messageTemplate.children().clone(true, true);
            content.find('[data-role="user-avatar"]').attr('src', data.user_avatar_url);
            content.find('[data-role="message-text"]').text(data.message);
            content.find('[data-role="message-date"]').text(data.updated_at);
            $element.append(content);
            $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000);
          }
        }
      );
    });
  });