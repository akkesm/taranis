module Admin.Job.MakeList where

import Admin.Controller.Prelude
import qualified Data.Dynamic
import qualified Data.Map as M
import qualified Data.HashTable.IO as H
import Statistics.Sample
import Database.PostgreSQL.Simple.Types
import Database.PostgreSQL.Simple.FromRow
import Database.PostgreSQL.Simple.SqlQQ

type HashTable k v = H.CuckooHashTable k v

instance Job MakeListJob where
    perform MakeListJob { .. } = do
        matches <- fetchMatches
        matchesCount <- query @Comparison |> fetchCount
        rankings :: HashTable Text Int <- H.new
        forEach matches \match -> do
            H.insert rankings (get #wins match) 0

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
