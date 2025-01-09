import { AppMainColor } from "../constant/colors"
import { AppRouterMap } from "../constant/router"
import { uploadFileToServer } from '../utils/upImg'
import { UserModule } from "../module"
import { common } from "@kit.AbilityKit"
import { rcpPost, baseUrl } from "../utils/http"
import { router } from "@kit.ArkUI"
import { showToast } from '../utils/showToast'
import { AppPreferences } from "../utils/AppStore"


@Component
export struct RegView {
  @State userFrom: UserModule = {
    userName: "",
    password: "",
    avatar: "",
    mobile: ""
  }
  @State repassword: string = ""
  @State checkBoxSelect: boolean = false
  @State uploadShow: boolean = true
  pathStack: NavPathStack | undefined
  // 防止多次点击
  @State notClick: boolean = true

  ShowToast(title: string) {
    let ShowToast = new showToast(title)
    ShowToast.ShowToast()
  }

  requestReg() {
    if (!this.checkBoxSelect) {
      this.ShowToast("请勾选用户协议")
      return
    }
    if (!this.userFrom.userName || !this.userFrom.password) {
      this.ShowToast("请输入用户名或密码")
      return
    }
    if (!(this.repassword === this.userFrom.password)) {
      this.ShowToast("密码不一致，请重新输入")
      return
    }
    rcpPost("/auth/reg", this.userFrom)
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
            this.ShowToast("用户名重复")
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
        Text("注册账号")
          .width('100%')
          .textAlign(TextAlign.Start)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        Column() {
          Image(this.userFrom.avatar)
            .width(80)
        }
        .borderRadius("50%")
        .clip(true)
        .width(80)
        .height(80)
        .backgroundImage($rawfile("jia.png"), ImageRepeat.Y)
        .backgroundImageSize({ width: 80, height: 80 })
        .border({
          width: "1px",
          color: "#ddd"
        })
        .onClick(() => {
          const context = getContext() as common.Context // 当前上下文
          uploadFileToServer(baseUrl + '/common/upload', context, (res) => {
            if (res!["success"]) {
              console.log(JSON.stringify(res))
              this.userFrom.avatar = baseUrl + res!["data"]
              console.log(this.userFrom.avatar)
            } else {
              console.log("上传文件失败")
            }
          })
        })
        .visibility(this.uploadShow ? Visibility.Visible : Visibility.Hidden)

        Text("点击上传用户头像").fontSize(14)
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

        TextInput({
          placeholder: '请再次输入密码',
          text: $$this.repassword
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
          placeholder: '请输入手机号',
          text: $$this.userFrom.mobile
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
          .onBlur(() => {
            let reg = /^(0|86|17951)?(13[0-9]|15[012356789]|166|17[3678]|18[0-9]|14[57])[0-9]{8}$/
            let flag = reg.test(this.userFrom.mobile as string)
            if (!flag) {
              this.ShowToast("请输入正确的手机号")
              return
            }
          })
        Button("注册")
          .width('45%')
          .backgroundColor(AppMainColor.PRIMARY_COLOR)
          .type(ButtonType.Normal)
          .onClick(() => {
            if (this.notClick) {
              this.requestReg()
            }

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

        Text("已有账号，我要注册")
          .fontSize(AppMainColor.SM)
          .fontColor(AppMainColor.GRAY_COLOR)
          .onClick(() => {
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
    .onReady(context => {
      this.pathStack = context.pathStack
    })
  }
}