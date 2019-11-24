#
#
#        TTJ
#        (c) Copyright 2019 Thomas Toftgaard Jarløv
#        Plugin for Nim Website Creator: Statistics
#        License: MIT
#
#

import
  datetime2human,
  logging,
  strutils

from times import epochTime

import ../../nimwcpkg/plugins/plugins

when defined(postgres): import db_postgres
else:                   import db_sqlite

proc pluginInfo() =
  let (n, v, d, u) = pluginGetDetails("statistics")
  echo " "
  echo "--------------------------------------------"
  echo "  Package:      " & n
  echo "  Version:      " & v
  echo "  Description:  " & d
  echo "  URL:          " & u
  echo "--------------------------------------------"
  echo " "
pluginInfo()

include "html.tmpl"

#[
proc statisticsSave*(db: DbConn): bool =
  ## Save statistics

  debug("Plugin Statistics: Saving stats")

  return true


proc statisticsCronRun*(db: DbConn, crontTime: int) =
  ## Start cron run

  debug("Plugin Statistics: Cron started")

  while true:
    statisticsSave(db)
    sleepAsync(crontTime)
]#

proc statisticsStart*(db: DbConn) =
  ## Required proc. Will run on each program start
  ##
  ## If there's no need for this proc, just
  ## discard it. The proc may not be removed.

  discard