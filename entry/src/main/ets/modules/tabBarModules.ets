export interface TabBarData {
  id: number
  name: string
  url: string
}

export const tabBarData: TabBarData[] = [
  {
    id: 1,
    name: "Honey",
    url: "ic_public_home",

  },
  {
    id: 2,
    name: "活动",
    url: "ic_gallery_discover",

  },
  {
    id: 3,
    name: "购物车",
    url: "ic_public_appstore"
  },
  {
    id: 4,
    name: "我的",
    url: "ic_public_contacts"
  }
]