module Admin.View.Comparisons.Edit where
import Admin.View.Prelude

data EditView = EditView { comparison :: Comparison }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ComparisonsAction}>Comparisons</a></li>
                <li class="breadcrumb-item active">Edit Comparison</li>
            </ol>
        </nav>
        <h1>Edit Comparison</h1>
        {renderForm comparison}
    |]

renderForm :: Comparison -> Html
renderForm comparison = formFor comparison [hsx|
    {(textField #skill1)}
    {(textField #skill2)}
    {(textField #winner)}
    {submitButton}
|]
