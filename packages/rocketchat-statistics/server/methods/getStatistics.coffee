Meteor.methods
	getStatistics: ->
		if not Meteor.userId()
			throw new Meteor.Error('invalid-user', "[methods] getStatistics -> Invalid user")

		console.log '[methods] getStatistics -> '.green, 'userId:', Meteor.userId(), 'arguments:', arguments

		unless Meteor.user()?.admin is true
			throw new Meteor.Error 'not-authorized', '[methods] getStatistics -> Not authorized'

		return RocketChat.statistics.get()