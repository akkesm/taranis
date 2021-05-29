module Admin.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types
import GHC.Generics (Generic)

data AdminApplication = AdminApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data SkillsController
    = SkillsAction
    | NewSkillAction
    | ShowSkillAction { skillId :: !(Id Skill) }
    | CreateSkillAction
    | EditSkillAction { skillId :: !(Id Skill) }
    | UpdateSkillAction { skillId :: !(Id Skill) }
    | DeleteSkillAction { skillId :: !(Id Skill) }
    deriving (Eq, Show, Data)

data ComparisonsController
    = ComparisonsAction
    | NewComparisonAction
    | ShowComparisonAction { comparisonId :: !(Id Comparison) }
    | CreateComparisonAction
    | EditComparisonAction { comparisonId :: !(Id Comparison) }
    | UpdateComparisonAction { comparisonId :: !(Id Comparison) }
    | DeleteComparisonAction { comparisonId :: !(Id Comparison) }
    deriving (Eq, Show, Data)

data Match = Match
    { wins :: Text
    , loses :: Text
    } deriving (Generic, Show)
