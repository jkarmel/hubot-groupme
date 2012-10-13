{TextMessage}   = require("hubot")
TwilioAdapter = require("hubot-twilio").Twilio

class GroupMe extends TwilioAdapter
  receive_sms: (smsBody, from) ->
    return if smsBody.length is 0
    user = @userForId from

		# TODO Assign self.robot.name here instead of 
    # if body.match(/^Nurph\b/i) is null
    #   console.log "I'm adding 'Nurph' as a prefix."
    #   body = 'Nurph' + '' + body

    if smsBody.indexOf("You've been added to a group with") == 0
      console.log "got init methods"
      @send_sms "hubot joining!", from, (args...)-> console.log args

    # GroupMe prepends "(username): " so need to remove that
    message = smsBody.slice smsBody.indexOf(":") + 2 

    @receive new TextMessage user, message

exports.use = (robot) ->
  new GroupMe robot

