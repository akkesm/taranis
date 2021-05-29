module Admin.View.Skills.Index where
import Admin.View.Prelude

data IndexView = IndexView { skills :: [Skill] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={SkillsAction}>Skills</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewSkillAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Skill</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach skills renderSkill}</tbody>
            </table>
        </div>
    |]


renderSkill skill = [hsx|
    <tr>
        <td>{skill}</td>
        <td><a href={ShowSkillAction (get #id skill)}>Show</a></td>
        <td><a href={EditSkillAction (get #id skill)} class="text-muted">Edit</a></td>
        <td><a href={DeleteSkillAction (get #id skill)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
