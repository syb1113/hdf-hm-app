import { AppRouterMap } from "../constant/router"


@Component
export struct CartView {
  pathStack: NavPathStack | undefined

  @Builder
  cartItemAction() {
    Row() {
      Button("删除")
    }
  }


  loadData() {
    if(this.pathStack?.getParamByName(AppRouterMap.CART)){
      // 获取参数
      // params.id
    }

  }

  build() {
    NavDestination() {
      Column() {
        //
        Text("购物车")
        List() {
          ListItem() {
            Column(){  Text("商品一")}
            .width("100%")
          }
          .swipeAction({
            end: this.cartItemAction()
          })
        }
      }
      .padding(4)
    }
    .title("购物车")
    .onReady(context => {
      this.pathStack = context.pathStack
    })
  }
}