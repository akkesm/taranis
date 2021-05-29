module Admin.Controller.Skills where

import Admin.Controller.Prelude
import Admin.View.Skills.Index
import Admin.View.Skills.New
import Admin.View.Skills.Edit
import Admin.View.Skills.Show

instance Controller SkillsController where
    action SkillsAction = do
        skills <- query @Skill |> fetch
        render IndexView { .. }

    action NewSkillAction = do
        let skill = newRecord
        render NewView { .. }

    action ShowSkillAction { skillId } = do
        skill <- fetch skillId
        render ShowView { .. }

    action EditSkillAction { skillId } = do
        skill <- fetch skillId
        render EditView { .. }

    action UpdateSkillAction { skillId } = do
        skill <- fetch skillId
        skill
            |> buildSkill
            |> ifValid \case
                Left skill -> render EditView { .. }
                Right skill -> do
                    skill <- skill |> updateRecord
                    setSuccessMessage "Skill updated"
                    redirectTo EditSkillAction { .. }

    action CreateSkillAction = do
        let skill = newRecord @Skill
        skill
            |> buildSkill
            |> ifValid \case
                Left skill -> render NewView { .. } 
                Right skill -> do
                    skill <- skill |> createRecord
                    setSuccessMessage "Skill created"
                    redirectTo SkillsAction

    action DeleteSkillAction { skillId } = do
        skill <- fetch skillId
        deleteRecord skill
        setSuccessMessage "Skill deleted"
        redirectTo SkillsAction

buildSkill skill = skill
    |> fill @["name","image"]
