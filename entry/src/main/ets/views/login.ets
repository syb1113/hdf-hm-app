import { AppMainColor } from "../constant/colors"
import { AppRouterMap } from "../constant/router"
import { UserModule } from "../module"
import { rcpPost, baseUrl } from "../utils/http"
import { router } from "@kit.ArkUI"
import { showToast } from '../utils/showToast'
import { AppPreferences } from "../utils/AppStore"

@Component
export struct LoginView {
  // @State chkSelected
  @State userFrom: UserModule = {
    userName: "",
    password: "",
  }
  @State checkBoxSelect: boolean = false
  // 防止多次点击
  @State notClick: boolean = true
  pathStack: NavPathStack | undefined

  ShowToast(title: string) {
    let ShowToast = new showToast(title)
    ShowToast.ShowToast()
  }

  requestLogin() {
    if (!this.checkBoxSelect) {
      this.ShowToast("请勾选用户协议")
      return
    }
    if (!this.userFrom.userName || !this.userFrom.password) {
      this.ShowToast("请输入用户名或密码")
      return
    }
    rcpPost("/auth/login", this.userFrom)
      .then(res => res.toJSON())
      .then(res => {
        if (res != null) {
          if (res!["success"]) {
            let ShowToast = new showToast(res["errorMessage"] + ",正在登录")
            this.notClick = false
            ShowToast.ShowToast()
            AppPreferences.setData("token", res!["data"])
            setTimeout(() => {
              router.replaceUrl({
                url: "pages/Index"
              })
            }, 2000)
          } else {
            this.ShowToast(res["errorMessage"])
          }
        }
      })
  }

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
          placeholder: '请输入用户名',
          text: $$this.userFrom.userName
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
          placeholder: '请输入密码',
          text: $$this.userFrom.password
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

        Button("登录")
          .width('45%')
          .backgroundColor(AppMainColor.PRIMARY_COLOR)
          .type(ButtonType.Normal)
          .onClick(() => {
            this.requestLogin()
          })
        Row() {
          Checkbox()
            .select(this.checkBoxSelect)
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .selectedColor(AppMainColor.PRIMARY_COLOR)
            .onChange((v) => {
              this.checkBoxSelect = v
            })
          Text("请勾选用户协议")
        }
        .width('100%')
        .justifyContent(FlexAlign.Start)
        .padding(8)

        Text("没有账号，我要注册")
          .fontSize(AppMainColor.SM)
          .fontColor(AppMainColor.GRAY_COLOR)
          .onClick(() => {
            this.pathStack?.replacePath({
              name: AppRouterMap.REG
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
    .onReady(context => {
      this.pathStack = context.pathStack
    })
  }
}