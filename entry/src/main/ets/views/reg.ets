import { AppMainColor } from "../constant/colors"
import { AppRouterMap } from "../constant/router"

@Component
export struct RegView{
  // @State chkSelected
  pathStack: NavPathStack | undefined
  build() {
    NavDestination() {
      Column({
        space: 8
      }) {
        Image($rawfile("images/jiankang.png"))
          .width(120)
        Text("欢迎登录")
          .width('100%')
          .textAlign(TextAlign.Start)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        TextInput({
          placeholder: '请输入用户名'
        })
          .border({
            width: {
              bottom: '1px'
            },
            color: "#999"
          })
          .padding(8)
          .backgroundColor("#fff")
          .borderRadius(0)

        TextInput({
          placeholder: '请输入密码'
        })
          .type(InputType.Password)
          .border({
            width: {
              bottom: '1px'
            },
            color: "#999"
          })
          .borderRadius(0)
          .padding(8)
          .backgroundColor("#fff")

        TextInput({
          placeholder: '请再次输入密码'
        })
          .type(InputType.Password)
          .border({
            width: {
              bottom: '1px'
            },
            color: "#999"
          })
          .borderRadius(0)
          .padding(8)
          .backgroundColor("#fff")

        Button("注册")
          .width('45%')
          .backgroundColor(AppMainColor.PRIMARY_COLOR)
          .type(ButtonType.Normal)
        Row() {
          Checkbox()
            .select(true)
            .shape(CheckBoxShape.ROUNDED_SQUARE)
          Text("请勾选用户协议")
        }
        .width('100%')
        .justifyContent(FlexAlign.Start)
        .padding(8)
        Text("已有账号，我要注册")
          .fontSize(AppMainColor.SM)
          .fontColor(AppMainColor.GRAY_COLOR)
          .onClick(()=>{
            this.pathStack?.replacePath({
              name: AppRouterMap.LOGIN
            })
          })
          .width('100%')
          .textAlign(TextAlign.End)
          .margin({
            right: 18
          })
      }
      .padding(8)
    }
    .onReady(context=>{
      this.pathStack = context.pathStack
    })
  }
}