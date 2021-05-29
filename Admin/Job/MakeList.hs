module Admin.Job.MakeList where

import Admin.Controller.Prelude
import qualified Data.Dynamic
import qualified Data.Vector as V
import Statistics.Sample
import Database.PostgreSQL.Simple.Types
import Database.PostgreSQL.Simple.FromRow
import Database.PostgreSQL.Simple.SqlQQ

instance Job MakeListJob where
    perform MakeListJob { .. } = do
        matches <- fetchMatches
        matchesCount <- query @Comparison |> fetchCount
        let matchesVector = V.fromList 
        forEach matches \match -> do
            skillW <- query @Skill |> findBy #name (get #wins match)
            skillL <- query @Skill |> findBy #name (get #losess match)
            let 
            let matchesVector V.! (get #id skillW) V.! (get #id skillL) = 0
            putStrLn $ tshow $ get #wins match

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
