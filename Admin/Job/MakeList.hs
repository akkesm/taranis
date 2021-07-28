module Admin.Job.MakeList where

import Admin.Controller.Prelude
import Data.Text.IO (writeFile)
import System.Directory (copyFile)
import qualified Data.HashTable.IO as H
import Database.PostgreSQL.Simple.Types
import Database.PostgreSQL.Simple.FromRow
import Database.PostgreSQL.Simple.SqlQQ
import Data.Time.Clock (getCurrentTime)
import Data.Time.Format (formatTime, defaultTimeLocale)

type HashTable k v = H.CuckooHashTable k v

instance Job MakeListJob where
    perform MakeListJob { .. } = do
        matches <- fetchMatches
        victories :: HashTable Text Int <- H.newSized 84
        losses :: HashTable Text Int <- H.newSized 84
        forEach matches \match -> do
            let winner = get #wins match
            maybeNumWins <- H.lookup victories winner
            let numWins = fromMaybe 0 maybeNumWins

            let loser = get #loses match
            maybeNumLosses <- H.lookup losses loser
            let numLosses = fromMaybe 0 maybeNumLosses

            H.insert victories winner $ numWins + 1
            H.insert losses loser $ numLosses + 1

        skills <- query @Skill |> fetch
        winRates ::HashTable Text Int <- H.newSized 84
        forEach skills \skill -> do
            let skillName = get #name skill

            maybeSkillWins <- H.lookup victories skillName
            let skillWins = fromMaybe 0 maybeSkillWins

            maybeSkillLosses <- H.lookup losses skillName
            let skillLosses = fromMaybe 0 maybeSkillLosses

            H.insert winRates skillName $ div skillWins skillLosses

        currentDate <- getCurrentTime
        let date = formatTime defaultTimeLocale "%F" currentDate
        let file = "../../static/lists/" ++ date ++ ".txt"
        forEach skills \skill -> do
            let skillName = get #name skill

            maybeSkillWinrate <- H.lookup winRates skillName
            let skillWinrate = fromMaybe 0 maybeSkillWinrate

            writeFile file (tshow skillWinrate ++ skillName ++ "\n")
        copyFile file "../../static/lists/latest.txt"


instance FromRow Match where
    fromRow = Match <$> field <*> field

fetchMatches :: (?modelContext :: ModelContext) => IO [Match]
fetchMatches = sqlQuery matchesQuery ()
  
matchesQuery :: Query
matchesQuery = [sql|
    SELECT
        ( CASE winner
            WHEN 1 THEN skill1
            ELSE skill2
          END
        ) AS wins,
        ( CASE winner
            WHEN 1 THEN skill2
            ELSE skill1
          END
        ) AS loses,
    FROM comparisons
    GROUP BY wins, loses
|]
