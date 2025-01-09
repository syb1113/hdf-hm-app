import { AppMainColor } from "../constant/colors"

@Component
export struct GoodsDetailView {
  build() {
    NavDestination() {
      Column({
        space: 12
      }) {
        //
        Image('https://img0.baidu.com/it/u=1589303047,2669814801&fm=253&fmt=auto&app=138&f=PNG?w=500&h=500')
          .height(200)
        Text("某某药品")
        Text("￥19.80")
          .fontColor(AppMainColor.RED_COLOR)
          .fontSize(AppMainColor.LG)
        Tabs() {
          TabContent()
            .tabBar("详情")

          TabContent()
            .tabBar("规格")

          TabContent()
            .tabBar("包装")

          TabContent()
            .tabBar("相关推荐")
        }
      }
      .padding(4)
    }
    .title("商品详情")

  }
}