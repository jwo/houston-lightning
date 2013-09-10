LightningTalks.factory "Talk", ($http) ->
  self = {}
  self.talks = []

  self.all = () ->
    self.talks

  self.addTalk = (talk) ->
    existing_talks = self.talks
    existing_talks.push(talk)
    self.talks = existing_talks

  self.currentStarted = ->
    _.find(self.talks, (t) ->
      t and t.current_talk == true
    )

  self.talkExists = (talk) ->
    _.find(self.talks, (t) ->
      t.id == talk.id
    )

  self.startTalk = (id) ->
    newTalks = _.map(self.talks, (t) ->
      t.current_talk = false
      if t.id == id
        t.started_at = new Date().getTime()
        t.current_talk = true if t.id == id
      t
    )
    self.talks = newTalks

  self.destroyTalk = (id) ->
    talk = _.findWhere(self.talks, {id: id})
    if talk
      index = _.indexOf(self.talks, talk)
      self.talks.splice(index, 1)

  self.loadTalks = () ->
    $http.get('/talks')
      .success (data) ->
        for d in data['talks']
          self.addTalk(d) unless self.talkExists(d)
  self
