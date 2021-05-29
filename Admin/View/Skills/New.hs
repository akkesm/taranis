module Admin.View.Skills.New where
import Admin.View.Prelude

data NewView = NewView { skill :: Skill }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={SkillsAction}>Skills</a></li>
                <li class="breadcrumb-item active">New Skill</li>
            </ol>
        </nav>
        <h1>New Skill</h1>
        {renderForm skill}
    |]

renderForm :: Skill -> Html
renderForm skill = formFor skill [hsx|
    {(textField #name)}
    {(textField #image)}
    {submitButton}
|]
