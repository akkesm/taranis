module Admin.View.Skills.Edit where
import Admin.View.Prelude

data EditView = EditView { skill :: Skill }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={SkillsAction}>Skills</a></li>
                <li class="breadcrumb-item active">Edit Skill</li>
            </ol>
        </nav>
        <h1>Edit Skill</h1>
        {renderForm skill}
    |]

renderForm :: Skill -> Html
renderForm skill = formFor skill [hsx|
    {(textField #name)}
    {(textField #image)}
    {submitButton}
|]
