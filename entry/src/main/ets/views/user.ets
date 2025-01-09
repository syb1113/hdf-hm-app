import { AppMainColor } from "../constant/colors"
import { AppRouterMap } from "../constant/router"

@Builder
function linkTo(txt: string, path: string, pathStack: NavPathStack | undefined) {
  Column({
    space: 6
  }) {
    Row() {
      Text(txt)
      Text(">")
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
    Divider()
      .width('100%')
      .color(AppMainColor.GRAY_COLOR)
      .height(1)
  }
  .width('100%')
  .padding(12)
  .onClick(()=>{
    pathStack?.pushPath({
      name: path
    })
  })

}

@Component
export struct UserView {
  @Require pathStack: NavPathStack | undefined
  build() {
    Column({
      space: 8
    }) {
      Column({
        space: 12
      }) {
        Image($rawfile("images/ys.png"))
          .height(40)
          .width(40)
          .borderRadius(20)
        Text("老王头")
          .fontSize(AppMainColor.LG)
      }
      .width('100%')
      .backgroundColor("#fff")
      .borderRadius(4)
      .padding(16)
      .margin({
        top: 100
      })

      // 导航
      Column({
        space: 4
      }) {
        linkTo("个人信息", AppRouterMap.USER_INFO, this.pathStack)
        linkTo("我的收藏", "", this.pathStack)
        linkTo("我的医生", "", this.pathStack)
        linkTo("购物车", "", this.pathStack)
        linkTo("我的订单", "", this.pathStack)
        linkTo("修改密码", "", this.pathStack)
      }
      .backgroundColor("#fff")
      .borderRadius(4)

      Button("登录")
        .onClick(()=>{
          this.pathStack?.replacePath({
            name: AppRouterMap.LOGIN
          })
        })
        .type(ButtonType.Normal)
        .backgroundColor(AppMainColor.PRIMARY_COLOR)
        .width('45%')
        .margin({
          top: 20
        })
    }
    .backgroundColor("#7af8f8f8")
    .width('100%')
    .height('100%')
    .borderRadius(4)
  }
}