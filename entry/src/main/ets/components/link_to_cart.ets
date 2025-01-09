import { AppMainColor } from '../constant/colors'
import { AppRouterMap } from '../constant/router'

@Component
export struct LinkToCart {
  @Require pathStack: NavPathStack | undefined

  build() {
    Column() {
      Image($rawfile("images/cart.png"))
    }
    .onClick(() => {
      this.pathStack?.pushPath({
        name: AppRouterMap.CART
      })
    })
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .width(50)
    .height(50)
    .padding(14)
    .borderRadius('50%')
    .backgroundColor(AppMainColor.PRIMARY_COLOR)
    .position({
      bottom: 200,
      right: 10
    })
    .zIndex(90)
  }
}