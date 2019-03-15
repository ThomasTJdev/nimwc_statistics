  get "/statistics/settings":
    createTFD()
    if not c.loggedIn or c.rank notin [Admin, Moderator]:
      redirect("/")

    resp genMain(c, genStatistics(db))