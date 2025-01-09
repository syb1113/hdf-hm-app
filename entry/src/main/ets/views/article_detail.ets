import { AppRouterMap } from "../constant/router"
interface PageParams {
  id: string
}

@Component
export struct ArticleDetailView {
  pathStack: NavPathStack | undefined

  // aboutToAppear(): void {
  //
  // }

  loadData() {
    if(this.pathStack?.getParamByName(AppRouterMap.ARTICLE_DETAIL)){
      // 获取参数
      let params = this.pathStack?.getParamByName(AppRouterMap.ARTICLE_DETAIL)[0] as PageParams
      // params.id
    }

  }

  build() {
    NavDestination() {
      Column() {
        //
        Text("资讯详情")
      }
      .padding(4)
    }
    .title("资讯详情")
    .onReady(context => {
      this.pathStack = context.pathStack
    })
  }
}