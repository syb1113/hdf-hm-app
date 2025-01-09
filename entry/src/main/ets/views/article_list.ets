import { AppRouterMap } from "../constant/router"

interface PageParams {
  id: string
}

@Component
export struct ArticleListView {
  pathStack: NavPathStack | undefined
  build() {
    NavDestination() {
      Column() {
        //
        Text("资讯列表")
          .onClick(()=>{
            const params: PageParams = {
              id: "9876"
            }
            this.pathStack?.pushPath({
              name: AppRouterMap.ARTICLE_DETAIL,
              param: params
            })
          })
      }
      .padding(4)
    }
    .onReady(context=>{
      this.pathStack = context.pathStack
    })
    .title("资讯列表")
  }
}