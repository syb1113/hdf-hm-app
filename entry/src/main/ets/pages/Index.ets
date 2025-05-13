import { AppRouterMap } from '../constant/router';
import {
  HomeView,
  HealthView,
  KnowledgeView,
  UserView,
  HospitalsView,
  PageNotFoundView,
  LoginView,
  RegView,
  DoctorsView,
  GoodsListView,
  ArticleListView,
  ArticleDetailView,
  GoodsDetailView,
  CartView,
  UserInfoView
} from '../views';

@Entry
@Component
struct Index {
  @State selIndex: number = 0;
  pathStack: NavPathStack = new NavPathStack()

  @Builder
  customNav() {
    Row() {
      Column({
        space: 4
      }) {
        Image(this.selIndex == 0 ? $rawfile("images/nav_home_sel.png") : $rawfile("images/nav_home.png"))
          .width(30)
        Text("首页")
          .fontSize(12)
      }.padding(4)
      .onClick(() => {
        this.selIndex = 0
      })

      Column({
        space: 4
      }) {
        Image(this.selIndex == 1 ? $rawfile("images/nav_jiankang_sel.png") : $rawfile("images/nav_jiankang.png"))
          .width(30)
        Text("健康")
          .fontSize(12)
      }.padding(4)
      .onClick(() => {
        this.selIndex = 1
      })

      Column({
        space: 4
      }) {
        Image(this.selIndex == 2 ? $rawfile("images/nav_knowledge_sel.png") : $rawfile("images/nav_knowledge.png"))
          .width(30)
        Text("科普")
          .fontSize(12)
      }.padding(4).onClick(() => {
        this.selIndex = 2
      })

      Column({
        space: 4
      }) {
        Image(this.selIndex == 3 ? $rawfile("images/nav_user_sel.png") : $rawfile("images/nav_user.png"))
          .width(30)
        Text("我的")
          .fontSize(12)
      }.onClick(() => {
        this.selIndex = 3
      })
      .padding(4)
    }
    .justifyContent(FlexAlign.SpaceAround)
    .width('100%')
  }

  @Builder
  pageMap(name: string) {
    // if
    // HomeView()
    if (name == AppRouterMap.FIND_HOSPITALS) {
      HospitalsView()
    } else if (name == AppRouterMap.LOGIN) {
      LoginView()
    } else if (name == AppRouterMap.REG) {
      RegView()
    } else if (name == AppRouterMap.DOCTORS) {
      DoctorsView()
    } else if (name == AppRouterMap.GOODS_LIST) {
      GoodsListView()
    } else if (name == AppRouterMap.GOODS_DETAIL) {
      GoodsDetailView()
    } else if (name == AppRouterMap.CART) {
      CartView()
    } else if (name == AppRouterMap.ARTICLE_LIST) {
      ArticleListView()
    } else if (name == AppRouterMap.ARTICLE_DETAIL) {
      ArticleDetailView()
    } else if(name == AppRouterMap.USER_INFO) {
      UserInfoView()
    } else {
      PageNotFoundView()
    }
  }

  build() {
    Navigation(this.pathStack) {
      Tabs({
        index: $$this.selIndex
      }) {
        TabContent() {
          HomeView({
            pathStack: this.pathStack
          })
        }

        TabContent() {
          HealthView({pathStack: this.pathStack})
        }

        TabContent() {
          KnowledgeView()
        }

        TabContent() {
          UserView({
            pathStack: this.pathStack
          })
        }

      }.barHeight(0)

    }
    .navDestination(this.pageMap)
    .toolbarConfiguration(this.customNav())
    .titleMode(NavigationTitleMode.Mini)
    .hideTitleBar(true)
  }
}