module Admin.View.Comparisons.New where
import Admin.View.Prelude

data NewView = NewView { comparison :: Comparison }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ComparisonsAction}>Comparisons</a></li>
                <li class="breadcrumb-item active">New Comparison</li>
            </ol>
        </nav>
        <h1>New Comparison</h1>
        {renderForm comparison}
    |]

renderForm :: Comparison -> Html
renderForm comparison = formFor comparison [hsx|
    {(textField #skill1)}
    {(textField #skill2)}
    {(textField #winner)}
    {submitButton}
|]
