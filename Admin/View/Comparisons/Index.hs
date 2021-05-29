module Admin.View.Comparisons.Index where
import Admin.View.Prelude

data IndexView = IndexView { comparisons :: [Comparison] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={ComparisonsAction}>Comparisons</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewComparisonAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Comparison</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach comparisons renderComparison}</tbody>
            </table>
        </div>
    |]


renderComparison :: Comparison -> Html
renderComparison comparison = [hsx|
    <tr>
        <td>{comparison}</td>
        <td><a href={ShowComparisonAction (get #id comparison)}>Show</a></td>
        <td><a href={EditComparisonAction (get #id comparison)} class="text-muted">Edit</a></td>
        <td><a href={DeleteComparisonAction (get #id comparison)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
