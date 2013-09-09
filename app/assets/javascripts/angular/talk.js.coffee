LightningTalks.factory "Talk", ($http) ->
  self = {}
  self.talks = []

  self.all = () ->
    self.talks

  self.addTalk = (talk) ->
    existing_talks = self.talks
    existing_talks.push(talk)
    self.talks = existing_talks

  self.talkExists = (talk) ->
    _.find(self.talks, (t) ->
      t.id == talk.id
    )

  self.loadTalks = () ->
    $http.get('/talks')
      .success (data) ->
        for d in data['talks']
          self.addTalk(d) unless self.talkExists(d)
  self
