module Admin.Controller.Comparisons where

import Admin.Controller.Prelude
import Admin.View.Comparisons.Index
import Admin.View.Comparisons.New
import Admin.View.Comparisons.Edit
import Admin.View.Comparisons.Show

instance Controller ComparisonsController where
    action ComparisonsAction = do
        comparisons <- query @Comparison |> fetch
        render IndexView { .. }

    action NewComparisonAction = do
        let comparison = newRecord
        render NewView { .. }

    action ShowComparisonAction { comparisonId } = do
        comparison <- fetch comparisonId
        render ShowView { .. }

    action EditComparisonAction { comparisonId } = do
        comparison <- fetch comparisonId
        render EditView { .. }

    action UpdateComparisonAction { comparisonId } = do
        comparison <- fetch comparisonId
        comparison
            |> buildComparison
            |> ifValid \case
                Left comparison -> render EditView { .. }
                Right comparison -> do
                    comparison <- comparison |> updateRecord
                    setSuccessMessage "Comparison updated"
                    redirectTo EditComparisonAction { .. }

    action CreateComparisonAction = do
        let comparison = newRecord @Comparison
        comparison
            |> buildComparison
            |> ifValid \case
                Left comparison -> render NewView { .. } 
                Right comparison -> do
                    comparison <- comparison |> createRecord
                    setSuccessMessage "Comparison created"
                    redirectTo ComparisonsAction

    action DeleteComparisonAction { comparisonId } = do
        comparison <- fetch comparisonId
        deleteRecord comparison
        setSuccessMessage "Comparison deleted"
        redirectTo ComparisonsAction

buildComparison comparison = comparison
    |> fill @["skill1","skill2","winner"]
