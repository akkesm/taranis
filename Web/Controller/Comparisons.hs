module Web.Controller.Comparisons where

import Web.Controller.Prelude
import Web.View.Comparisons.Index
import Web.View.Comparisons.New
import Database.PostgreSQL.Simple.Types

instance Controller ComparisonsController where
    action ComparisonsAction = render IndexView

    action NewComparisonAction { vote } = do
        let comparison = newRecord
        skillOne <- sqlQuery "SELECT * FROM skills ORDER BY RANDOM() LIMIT 1" ()
        skillTwo <- sqlQuery "SELECT * FROM skills WHERE NOT id = ? ORDER BY RANDOM() LIMIT 1" (Only (get #id (skillOne !! 0)))
        render NewView { comparison = comparison, skillOne = skillOne !! 0, skillTwo = skillTwo !! 0, vote = vote }

    action CreateComparisonAction = do
        let comparison = newRecord @Comparison
        vote <- getSessionInt "currentVote"
        let voteInt :: Int = fromMaybe 1 vote
        if voteInt >= 83
            then do
                setSession "currentVote" ""
                redirectTo ComparisonsAction
            else do
                setSession "currentVote" (tshow (voteInt + 1))
                body <- getRequestBody
                putStrLn (tshow body)
                comparison
                    |> buildComparison
                    |> ifValid \case
                        Left comparison -> redirectTo NewComparisonAction { vote }
                        Right comparison -> do
                            comparison <- comparison |> createRecord
                            redirectTo NewComparisonAction { vote }

    action WinnerNoneComparisonAction = do
        vote <- getSessionInt "currentVote"
        let voteInt :: Int = fromMaybe 1 vote
        if voteInt >= 83
            then do
                setSession "currentVote" ""
                redirectTo ComparisonsAction
            else do
                setSession "currentVote" (tshow (voteInt + 1))
                redirectTo NewComparisonAction { vote }

buildComparison comparison = comparison
    |> fill @["skill1","skill2","winner"]
