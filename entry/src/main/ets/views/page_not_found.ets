@Component
export struct PageNotFoundView {
  build() {
    NavDestination() {
      Image($rawfile("images/404.png"))
        .width("100%")
      Text("页面找不到") 
    }

  }
}