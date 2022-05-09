module Web.View.Post.Show where
import Web.View.Prelude
import qualified Text.MMark as MMark
import Web.View.Comments.Index
data ShowView = ShowView { post :: Include "comments" Post }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={PostAction}>Post</a></li>
                <li class="breadcrumb-item active">Show Post</li>
            </ol>
        </nav>
        <h1>{get #title post}</h1>
        <p>{get #createdAt post |> timeAgo}</p>
        <div>{get #body post |> renderMarkdown }</div>
        <a href={NewCommentAction (get #id post)}> 评论 </a>
        <table class="table">
        <tbody>{forEach (get #comments post) renderComment}</tbody>
        </table>
    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "Post" PostAction
                            , breadcrumbText "Show Post"
                            ]

renderMarkdown text = case text |> MMark.parse "" of
        Left error -> "Something went wrong"
        Right markdown -> MMark.render markdown |> tshow |> preEscapedToHtml