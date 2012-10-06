{TextMessage}   = require("hubot")
TwilioAdapter = require "hubot-twilio"

class GroupMe extends TwilioAdapter
  receive_sms: (smsBody, from) ->
    return if body.length is 0
    user = @userForId from

		# TODO Assign self.robot.name here instead of 
    # if body.match(/^Nurph\b/i) is null
    #   console.log "I'm adding 'Nurph' as a prefix."
    #   body = 'Nurph' + '' + body

    # GroupMe prepends username so need to remove that
    message = smsBody.slice smsBody.indexOf(":") + 2 

    @receive new TextMessage user, message

exports.use = (robot) ->
  new GroupMe robot

