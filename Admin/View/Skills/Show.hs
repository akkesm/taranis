module Admin.View.Skills.Show where
import Admin.View.Prelude

data ShowView = ShowView { skill :: Skill }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={SkillsAction}>Skills</a></li>
                <li class="breadcrumb-item active">Show Skill</li>
            </ol>
        </nav>
        <h1>Show Skill</h1>
        <p>{skill}</p>
    |]
